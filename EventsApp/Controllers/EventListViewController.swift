//
//  EventListViewController.swift
//  EventsApp
//
//  Created by Arqam Owais on 29/09/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import UIKit

final class EventListViewController: UIViewController {
    
    var viewModel: EventListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "EventListViewController") as! EventListViewController
        return controller
    }
    
    // MARK: - Private Functions
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        barButtonItem.tintColor = UIColor.primary
        
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
        
    @objc
    private func tappedAddEventButton() {
        viewModel.tappedAddEvent()
    }

}
