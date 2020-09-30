//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Arqam Owais on 01/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

final class AddEventViewModel {
    
    var coordinator: AddEventCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    deinit {
        print("deinit from AddEventViewModel ")
    }
}
