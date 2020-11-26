//
//  CKController.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 6/29/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation
import CloudKit
import SwiftUI


enum ICloudError {
    case ICloudNotEnabled
    case other
    
    var description : String {
        switch self {
        case .ICloudNotEnabled:
            return "Muscle Journal uses your ICloud to store your data. Please log into your iCloud."
        case .other:
            return "Ooops! something went wrong, lets try again"
        }
    }
}

enum ICloudStatus {
    case available
    case notAvailable
    case checking
    
    var message : String {
        switch self {
        case .available:
            return "You can always delete Protein's Journal Data in settings"
        case .notAvailable:
            return "Protein Journal uses your iCloud to save your progress, please sign in into your iCloud and try again (you can delete it at anytime"
        case .checking:
            return "Checking iCloud services"
        }
    }
}


final class CKController : ObservableObject {
    
    @Published private(set) var status = ICloudStatus.notAvailable
    private var recordID : CKRecord.ID?
    
    init() {
        if UserDefaults.standard.bool(forKey: Constants.ICloudKeys.isICloudAvailable) {
            self.status = .available
        } else {
            self.status = .checking
        }
    }
    
    internal func getUserRecordID() {
        let defaultContainer = CKContainer.default()
        defaultContainer.fetchUserRecordID { (recordID, error) in
            if let responseError = error {
                print(responseError.localizedDescription)
                self.updateStatus(newStatus: .notAvailable)
            } else if let userRecordID = recordID {
                print(userRecordID)
                self.recordID = userRecordID
                self.updateStatus(newStatus: .available)
            }
        }
    }
    
    private func fetchUserRecord(recordID: CKRecord.ID) {
        let defaultContainer = CKContainer.default()
        let privateDB = defaultContainer.privateCloudDatabase
        privateDB.fetch(withRecordID: recordID) { (record, error) in
            if let responseError = error {
                print(responseError.localizedDescription)
            } else if let userRecord = record {
                print(userRecord)
            }
        }
    }
    
    private func updateStatus(newStatus: ICloudStatus) {
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (timer) in
                    withAnimation {
                        self.status = newStatus
                    }
            }
        }
    }
}
