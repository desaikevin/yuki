//
//  DetailViewController.swift
//  ParksPicker
/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
  @IBOutlet fileprivate weak var imageView: UIImageView!
  @IBOutlet fileprivate weak var nameLabel: UILabel!
  @IBOutlet fileprivate weak var stateLabel: UILabel!
  @IBOutlet fileprivate weak var dateLabel: UILabel!
     @IBOutlet weak var scrollView: UIScrollView!
    
  
  var park: Park?
    
    override func viewDidLoad() {
        
        scrollView.delegate = self
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        scrollView.zoomScale = 1.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView 
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if let nationalPark = park {
      navigationItem.title = nationalPark.name
      imageView.image = UIImage(named: nationalPark.photo)
      nameLabel.text = nationalPark.name
      stateLabel.text = nationalPark.state
      dateLabel.text = nationalPark.date
    }

  }
}
