//
//  DayHelper.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 12/2/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation

fileprivate enum DayEntityKeys {
    case lastDay
    var key : String { return "lastDayKey" }
}

extension Day {
    
    static func saveDay() {
        UserDefaults.standard.set(Date(), forKey: DayEntityKeys.lastDay.key)
    }
    
    static func isNewDay() -> Bool {
        guard let lastDay = UserDefaults.standard.object(forKey: DayEntityKeys.lastDay.key) as? Date else { return false }
        return Calendar.current.isDate(Date(), inSameDayAs: lastDay)
    }
}

extension Date {
    static func formattedDate(from date: Date?) -> String? {
        guard let dayDate = date else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        return formatter.string(from: dayDate)
    }
}
