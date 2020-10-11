//
//  EventDetailViewController.swift
//  EventsApp
//
//  Created by Arqam Owais on 11/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import UIKit

final class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var viewModel: EventDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdate = { [weak self] in
            self?.backgroundImageView.image = self?.viewModel.image
        }
        viewModel.viewDidLoad()
    }
    
}
