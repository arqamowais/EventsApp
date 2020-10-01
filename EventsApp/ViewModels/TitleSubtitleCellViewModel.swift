//
//  TitleSubtitleCellViewModel.swift
//  EventsApp
//
//  Created by Arqam Owais on 01/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//


final class TitleSubtitleCellViewModel {
    
    enum CellType {
        case text
        case date
    }
    
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    let type: CellType
    
    init(title: String, subtitle: String, placeholder: String, type: CellType) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
        self.type = type
    }
    
    func update(_ subtitle: String) {
        self.subtitle = subtitle
    }
    
}
