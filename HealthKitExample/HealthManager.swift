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
    
    /*
     https://developer.apple.com/reference/healthkit
     https://developer.apple.com/reference/healthkit/1627060-healthkit_constants#//apple_ref/doc/constant_group/Fitness_Identifiers
     https://developer.apple.com/reference/healthkit/hkcategorytypeidentifier/1615425-sleepanalysis
     https://developer.apple.com/reference/healthkit/1627060-healthkit_constants/2315150-characteristics_type_identifiers
     
     
     APPCODA
     https://www.appcoda.com/healthkit-introduction/
     
     NATASHA
     https://www.natashatherobot.com/healthkit-asking-for-identifying-information/
     https://www.natashatherobot.com/healthkit-units/
     https://www.natashatherobot.com/healthkit-getting-fitness-data/
     
     
     RAYWENDERLICH
     https://www.raywenderlich.com/86336/ios-8-healthkit-swift-getting-started
     
     
     RXSWIFT
     https://viblo.asia/minhtran/posts/XQZkxWOgewA
     https://chucuoi.net/2016/10/08/gioi-thieu-reactivex-swift/
     https://kipalog.com/posts/Reactive-Programming-voi-RxSwift
     https://dangthaison91.wordpress.com/
     
     APPWATCH
     https://dangthaison91.wordpress.com/
     
     
 */
    
    
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
