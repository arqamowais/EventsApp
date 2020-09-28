//
//  AppCoordinator.swift
//  EventsApp
//
//  Created by Arqam Owais on 29/09/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {
        get
    }
    
    func start()
}

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    
    var childCoordinators: [Coordinator] = []
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navController = UINavigationController()
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
}
