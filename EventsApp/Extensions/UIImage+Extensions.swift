//
//  UIImage+Extensions.swift
//  EventsApp
//
//  Created by Arqam Owais on 11/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func sameAspectRatio(newHeight: CGFloat) -> UIImage {
        let scale = newHeight/size.height
        let newWidth = size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            self.draw(in: .init(origin: .zero, size: newSize))
        }
    }
}
