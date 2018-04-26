//
//  CameraController.swift
//  TappyTips
//
//  Created by Daniel Shiferaw on 4/24/18.
//  Copyright © 2018 Daniel Shiferaw. All rights reserved.
//

import UIKit
import ImagePicker
import Lightbox

class CameraController: UIViewController, ImagePickerDelegate {
    
    var imagePicker: ImagePickerController? = nil
    let max_image = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var config = Configuration()
        config.doneButtonTitle = "Post"
        config.noImagesTitle = "Sorry! Thre are no images here!"
        config.recordLocation = false
        config.allowVideoSelection = false
        imagePicker = ImagePickerController(configuration: config)
        imagePicker?.delegate = self
        imagePicker?.imageLimit = max_image
        present(imagePicker!, animated: true, completion: nil)
    }
    
    
    // MARK: - ImagePickerDelegate
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        
        let lightboxImages = images.map {
            return LightboxImage(image: $0)
        }
        
        let lightbox = LightboxController(images: lightboxImages, startIndex: 0)
        imagePicker.present(lightbox, animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagePicker.dismiss(animated: true, completion: nil)
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let images:[UIImage] = AssetManager.resolveAssets(imagePicker.stack.assets)
        print("Number of photos we already have: \(homeController.posts.count)")
        print("Number of photos we just took: \(images.count)")
        homeController.posts.append(contentsOf: images)
        print("Number of photos intotal: \(homeController.posts.count)")
        navigationController?.pushViewController(homeController, animated: true)
    }
    

    
}
