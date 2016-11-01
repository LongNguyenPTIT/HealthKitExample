//
//  HealthManager.swift
//  HealthKitExample
//
//  Created by Nguyen Nam Long on 10/28/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import Foundation
import HealthKit

class HealthManager {

    var healthStore: HKHealthStore?
    

    
    
    func setup() {
        let bloodtype = HKCharacteristicType.characteristicType(forIdentifier: .bloodType)
        let sex = HKCharacteristicType.characteristicType(forIdentifier: .biologicalSex)
//        let weight = HKCategoryType.categoryType(forIdentifier: )
        
        
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }else {
            healthStore = nil
        }
        
        let dataRead = NSSet(objects: bloodtype, sex)
        
        healthStore?.requestAuthorization(toShare: nil, read: dataRead as? Set<HKObjectType>, completion: { (success, error) in
            if success {
                print(success)
                print(self.getData())
            }
            
        })
        
        
    }
    
    
    func getData () -> String {
        if let bloodType = try! healthStore?.bloodType() {
            switch bloodType.bloodType {
            case .abPositive: return "A+"
            case .aNegative: return "A-"
            case .bPositive: return "B+"
            case .bNegative: return "B-"
            case .abPositive: return "AB+"
            case .abNegative: return "AB-"
            case .oPositive: return "O+"
            case .oNegative: return "O-"
            default: return "Not Set"
            }
        }
        return " "
        
        
        
    }
    
    
    
}
