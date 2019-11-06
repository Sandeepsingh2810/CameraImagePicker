//
//  BaseImagePickerViewController.swift
//  CameraImagePicker
//
//  Created by Sandeep Jangra on 2019-11-06.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class BaseImagePickerViewController: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    let imagePicker = UIImagePickerController()
    var imgPass = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func openOtions() {
        let alert = UIAlertController(title: "Choose Image", message: "Pick Image From :", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {btn in
            self.imagePicker.sourceType = .camera
            self.openPicker()
        })
        
        let gallaryAction = UIAlertAction(title: "Gallary", style: .default, handler: {btn in
            self.imagePicker.sourceType = .photoLibrary
            self.openPicker()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cameraAction)

        alert.addAction(gallaryAction)

        alert.addAction(cancelAction)
        
        self.present(alert,animated: true ,completion: nil)
    }
    
    func selectedImage(chooseImage:UIImage){
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chooseImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        selectedImage(chooseImage: chooseImage)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func openPicker() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}
