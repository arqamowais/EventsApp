//
//  EventListViewController.swift
//  EventsApp
//
//  Created by Arqam Owais on 29/09/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import UIKit

final class EventListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "EventListViewController") as! EventListViewController
        return controller
    }

}
