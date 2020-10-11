//
//  EventDetailCoordinator.swift
//  EventsApp
//
//  Created by Arqam Owais on 11/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import UIKit
import CoreData

final class EventDetailCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController!
    private var eventID: NSManagedObjectID
    
    init(eventID: NSManagedObjectID, navigationController: UINavigationController) {
        self.eventID = eventID
        self.navigationController = navigationController
    }

    func start() {
        let detailViewController: EventDetailViewController = .instantiate()
        detailViewController.viewModel = EventDetailViewModel(eventID: eventID)
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
}
