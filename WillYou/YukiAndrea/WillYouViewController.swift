//
//  WillYouViewController.swift
//  ParksPicker
//
//  Created by Kevin Desai on 4/8/18.
//  Copyright © 2018 Razeware, LLC. All rights reserved.
//

import UIKit
import AVKit
import Photos

class WillYouViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    
    @IBAction func CameraButton(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.camera)
        {
            let imagePicker = UIImagePickerController()

            imagePicker.delegate = self
            imagePicker.sourceType =
                UIImagePickerControllerSourceType.camera
            imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.front
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true,
                         completion: nil)
        }
        CameraButton.isHidden = true
    }
    
    
    @IBOutlet var CameraButton: UIButton!
    @IBOutlet var lookAtMe: UILabel!
    var selectedImage: UIImage?
    var picker: UIImagePickerController?
    
    @IBOutlet weak var sheSaidYes: UIImageView?
    let alert = UIAlertController(title: "",
                                  message: "",
                                  preferredStyle: .alert)

    override func viewDidLoad() {
        
                super.viewDidLoad()
 
        presentAlert()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentAlert() {
        
        let titleFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "AmericanTypewriter", size: 18)! ]
        let messageFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "HelveticaNeue-Thin", size: 14)! ]
        let attributedTitle = NSMutableAttributedString(string: "Marry Me?", attributes: titleFont)
        let attributedMessage = NSMutableAttributedString(string: "Select an Action", attributes: messageFont)
        alert.setValue(attributedTitle, forKey: "attributedTitle")
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        
        let action1 = UIAlertAction(title: "Yes!", style: .default, handler: { (action) -> Void in
            print("Yes selected!")
            self.lookAtMe.isHidden = false
            
        })
        
        let action2 = UIAlertAction(title: "No!", style: .default, handler: { (action) -> Void in
            print("No!")
            fatalError()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in
            self.navigationController?.popToRootViewController(animated: true)
        })
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    @nonobjc func imagePickerControllerSelect(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.sheSaidYes?.contentMode = .scaleAspectFit
        self.sheSaidYes?.image = selectedImage
        self.dismiss(animated: true, completion: nil);
    }
    
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        picker.dismiss(animated: true, completion: nil)
        sheSaidYes?.image = info["UIImagePickerControllerOriginalImage"] as? UIImage
        UIImageWriteToSavedPhotosAlbum((sheSaidYes?.image)!, nil, nil, nil)
    }
    


}
