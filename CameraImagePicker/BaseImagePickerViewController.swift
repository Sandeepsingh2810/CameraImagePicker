//
//  BaseImagePickerViewController.swift
//  CameraImagePicker
//
//  Created by Sandeep Jangra on 2019-11-06.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVKit
import AVFoundation
class BaseImagePickerViewController: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate=self
        imagePicker.allowsEditing=true
        imagePicker.mediaTypes=["public.image"]
        print(UIImagePickerController.availableMediaTypes(for: .photoLibrary)!)
    }
    
    func openOptions() {
        
        
        let alert = UIAlertController(title: "Choose Image", message: "Pick Image From :", preferredStyle: .alert)
        
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.camera)
        {
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {btn in
            
            self.imagePicker.sourceType = .camera
            self.openPicker()
            })
            alert.addAction(cameraAction)
        }
        
        let gallaryAction = UIAlertAction(title: "Gallary", style: .default, handler: {btn in
            self.imagePicker.sourceType = .photoLibrary
            self.openPicker()
        })
        let cameraRollAction = UIAlertAction(title: "Camera Rolls", style: .default, handler: {btn in
        self.imagePicker.sourceType = .savedPhotosAlbum
        self.openPicker()
        })
        let videoAction = UIAlertAction(title: "Pick Video", style: .default, handler: {btn in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.mediaTypes = [(kUTTypeMovie as String)]
            self.openPicker()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cameraRollAction)
        alert.addAction(videoAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert,animated: true ,completion: nil)
    }
    
    func selectedImage(chooseImage:UIImage){
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        
        dismiss(animated: true, completion: nil)
        if imagePicker.mediaTypes == ["public.image"]{
        let chooseImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        
        selectedImage(chooseImage: chooseImage)
        dismiss(animated: true, completion: nil)
        
        }
        
        else if imagePicker.mediaTypes == [(kUTTypeMovie as String)]
        {
            let url = info[UIImagePickerController.InfoKey.mediaURL] as! URL
            imagePicker.allowsEditing=false
            print(url)

            let player = AVPlayer(url: url)
            let contoller = AVPlayerViewController()
            contoller.player = player
            present(contoller, animated: true)
            {
                player.play()
            }
            
        }
        
        }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func openPicker() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}
