//
//  ImagePickerCoordinator.swift
//  EventsApp
//
//  Created by Arqam Owais on 10/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import Foundation
import UIKit

final class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: Coordinator?
    var onFinishPicking: (UIImage) -> Void = { _ in }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        navigationController.present(imagePickerController, animated: true, completion: nil)
    }
    
}

extension ImagePickerCoordinator: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            onFinishPicking(image)
        }
        parentCoordinator?.childDidFinish(self)
    }
    
}
