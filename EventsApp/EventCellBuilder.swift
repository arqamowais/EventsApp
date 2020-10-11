//
//  EventCellBuilder.swift
//  EventsApp
//
//  Created by Arqam Owais on 10/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import Foundation

struct EventCellBuilder {
    
    func makeTitleSubtitleCellViewModel(_ type: TitleSubtitleCellViewModel.CellType, onCellUpdate: (() -> Void)?) -> TitleSubtitleCellViewModel {
        
        switch type {
        case .text:
            return TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name", type: .text, onCellUpdate: onCellUpdate)
        case .date:
            return TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date", type: .date, onCellUpdate: onCellUpdate)
        case .image:
            return TitleSubtitleCellViewModel(title: "Background", subtitle: "", placeholder: "", type: .image, onCellUpdate: onCellUpdate)
        }
        
    }
    
    
    
    
}
