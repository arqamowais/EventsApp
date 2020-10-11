//
//  EventDetailViewModel.swift
//  EventsApp
//
//  Created by Arqam Owais on 11/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class EventDetailViewModel {
    
    private let eventID: NSManagedObjectID
    private let coreDataManager: CoreDataManager
    private var event: Event?
    
    var onUpdate = {}
    
    var image: UIImage? {
        guard let imageData = event?.image else {
            return nil
        }
        return UIImage(data: imageData)
    }
    
    init(eventID: NSManagedObjectID, coreDataManager: CoreDataManager = .shared) {
        self.eventID = eventID
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        event = coreDataManager.getEvent(eventID)
        onUpdate()
    }
    
}
