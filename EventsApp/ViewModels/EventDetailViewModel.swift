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
    
    private let date = Date()
    private let eventID: NSManagedObjectID
    private let coreDataManager: CoreDataManager
    private var event: Event?
    var coordinator: EventDetailCoordinator?
    
    var onUpdate = {}
    
    var image: UIImage? {
        guard let imageData = event?.image else {
            return nil
        }
        return UIImage(data: imageData)
    }
    
    var timeRemainingViewModel: TimeRemainingViewModel? {
        guard let eventDate = event?.date, let timeRemainingParts = date.timeRemaining(until: eventDate)?.components(separatedBy: ",") else {
            return nil
        }
        return TimeRemainingViewModel(timeRemainingParts: timeRemainingParts, mode: .detail)
    }
    
    init(eventID: NSManagedObjectID, coreDataManager: CoreDataManager = .shared) {
        self.eventID = eventID
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        reload()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
    
    func reload() {
        event = coreDataManager.getEvent(eventID)
        onUpdate()
    }
    
    @objc func editButtonTapped() {
        guard let event = self.event else {
            return
        }
        coordinator?.onEditEvent(event: event)
    }
}
