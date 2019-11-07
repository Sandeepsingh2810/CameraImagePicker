//
//  ViewController.swift
//  CameraImagePicker
//
//  Created by Sandeep Jangra on 2019-11-06.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class ViewController: BaseImagePickerViewController{

    @IBOutlet weak var displayImage: UIImageView!
    
    @IBAction func chooseImageBtn(_ sender: UIButton)
    {
        openOptions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func selectedImage(chooseImage: UIImage) {
        displayImage.image=chooseImage
    }

}

