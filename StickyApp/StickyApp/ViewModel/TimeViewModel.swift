//
//  TimeViewModel.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import Foundation
import Combine

class TimeViewModel: ObservableObject {
    @Published var currentTime: String = ""
    private var timer: AnyCancellable?
    
    init(){
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink{ [weak self] _ in
                self?.updateTime()
                
            }
        updateTime()
    }
    
    private func updateTime(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a" // 12-hour format 
        currentTime = dateFormatter.string(from: Date())
    }
    
    
}
