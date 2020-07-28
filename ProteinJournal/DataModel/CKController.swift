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
            return "Protein Journal uses your iCloud to save your data, you can delete it at anytime"
        case .checking:
            return "Checking iCloud services"
        }
    }
}


final class CKController : ObservableObject {
    
    @Published private(set) var iCloudStatus = ICloudStatus.notAvailable
    
    init() {
        let isICloudAvailable = UserDefaults.standard.bool(forKey: Constants.ICloudKeys.isICloudAvailable)
        if isICloudAvailable {
            self.iCloudStatus = .available
        } else {
            self.iCloudStatus = .checking
        }
    }
    
    private var recordID : CKRecord.ID?
    
    internal func getUserRecordID(completion: @escaping (ICloudError?)-> Void) {
        let defaultContainer = CKContainer.default()
        defaultContainer.fetchUserRecordID { (recordID, error) in
            if let responseError = error {
                print(responseError.localizedDescription)
                self.iCloudStatus = .notAvailable
                completion(ICloudError.ICloudNotEnabled)
            } else if let userRecordID = recordID {
                DispatchQueue.main.sync {
                    self.recordID = userRecordID
                    self.iCloudStatus = .available
                    print(userRecordID)
                    completion(nil)
                }
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
}
