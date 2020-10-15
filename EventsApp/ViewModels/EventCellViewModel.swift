//
//  EventCellViewModel.swift
//  EventsApp
//
//  Created by Arqam Owais on 10/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import UIKit
import CoreData

struct EventCellViewModel {
    
    static let imageCache = NSCache<NSString, UIImage>()
    private let date = Date()
    private let imageQueue = DispatchQueue(label: "imageQueue", qos: .background)
    private var event: Event

    private var cacheKey: String {
        event.objectID.description
    }
    
    var onSelect: (NSManagedObjectID) -> Void = { _ in }
    
    var timeRemainingStrings: [String] {
        guard let eventDate = event.date else {
            return []
        }
        return date.timeRemaining(until: eventDate)?.components(separatedBy: ",") ?? []
    }
    
    var dateText: String? {
        guard let eventDate = event.date else {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: eventDate)
    }
    
    var eventName: String? {
        event.name
    }
    
    var timeRemainingViewModel: TimeRemainingViewModel? {
        guard let eventDate = event.date, let timeRemainingParts = date.timeRemaining(until: eventDate)?.components(separatedBy: ",") else {
            return nil
        }
        return TimeRemainingViewModel(timeRemainingParts: timeRemainingParts, mode: .cell)
    }
    
    init(_ event: Event) {
        self.event = event
    }
    
    func loadIamge(completion: @escaping(UIImage?) -> Void) {
        if let image = Self.imageCache.object(forKey: cacheKey as NSString) {
            completion(image)
        } else {
            imageQueue.async {
                guard let imageData = self.event.image, let image = UIImage(data: imageData) else {
                    completion(nil)
                    return
                }
                Self.imageCache.setObject(image, forKey: self.cacheKey as NSString)
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
    
    func didSelect() {
        onSelect(event.objectID)
    }
    
}
