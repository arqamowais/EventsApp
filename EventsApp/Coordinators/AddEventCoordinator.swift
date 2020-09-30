//
//  AddEventCoordinator.swift
//  EventsApp
//
//  Created by Arqam Owais on 01/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import Foundation
import UIKit

final class AddEventCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController!
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let addEventViewController: AddEventViewController = .instantiate()
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        navigationController.present(addEventViewController, animated: true, completion: nil)
    }
    
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
        
    deinit {
        print("deinit from AddEventCoordinator")
    }
}
