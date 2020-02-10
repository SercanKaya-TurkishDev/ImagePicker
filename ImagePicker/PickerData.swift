//
//  PickerData.swift
//  ImagePicker
//
//  Created by Sercan KAYA on 7.02.2020.
//  Copyright © 2020 Sercan KAYA. All rights reserved.
//

import SwiftUI

class PickerCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @Binding var image : UIImage?
    @Binding var showPicker : Bool
    
    init(image: Binding<UIImage?>, showPicker: Binding<Bool>){
        _image = image
        _showPicker = showPicker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let choosePic = info[.originalImage] as! UIImage
        self.image = choosePic
        self.showPicker = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.showPicker = false
    }
}
struct PickerPageView : UIViewControllerRepresentable {
    @Binding var image : UIImage?
    @Binding var showPicker : Bool
    func makeCoordinator() -> PickerCoordinator{
        return PickerCoordinator(image: $image, showPicker: $showPicker)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<PickerPageView>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<PickerPageView>) {
        
    }
    
}
