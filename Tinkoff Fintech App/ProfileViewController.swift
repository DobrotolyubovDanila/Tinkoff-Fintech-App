//
//  ViewController.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 10.09.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
//        print(editButton.frame)
//        Пункт 3.2 – свойство frame еще нельзя распечатать,
//        так как САМА кнопка еще не проинициализирована
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(editButton.frame)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(editButton.frame)
        /*
         Свойства frame отличаются из-за того, что в петвом случае
         наш основной view и его subViews были загружены,но не "обработаны" Auto Layout.
             
         Во втором случае механизм уже отработал. Frame стал соотсетствовать констрейнтам.
         Поэтому округление провожу в
         текущем методе.
         */
        
        profileImageButton.layer.cornerRadius = profileImageButton.bounds.height/2
        profileImageButton.clipsToBounds = true
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height/2
        profileImageView.clipsToBounds = true
        
        editButton.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
    }
    
    @IBAction func imageButtonPressed(_ sender: UIButton) {

        let cameraIcon = #imageLiteral(resourceName: "camera")
        let photoLiteral = #imageLiteral(resourceName: "photo")
        
        let actionSheet = UIAlertController(title: nil,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.chooseImagePicker(source: UIImagePickerController.SourceType.camera)
        })
        camera.setValue(cameraIcon, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let photo = UIAlertAction(title: "Photo", style: .default, handler: { _ in
            self.chooseImagePicker(source: UIImagePickerController.SourceType.photoLibrary)
        })
        photo.setValue(photoLiteral, forKey: "image")//Добавление изображения всплывающему меню
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")//выравнивание слева
        
        let cansel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cansel)
        
        present(actionSheet, animated:true)
        
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func chooseImagePicker(source: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true //Редактирование после выбора
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey: Any]){
        
        if let image = info[.editedImage] as? UIImage {
            print(image.description)
        }
        
        profileImageView.image = info[.editedImage] as? UIImage
        profileImageView.contentMode = .scaleAspectFill
        
        profileLabel.isHidden = true
        
        dismiss(animated: true, completion: nil)
    }
    
}
