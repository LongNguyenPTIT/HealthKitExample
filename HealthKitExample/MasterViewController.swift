//
//  MasterViewController.swift
//  HealthKitExample
//
//  Created by Nguyen Nam Long on 10/27/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import UIKit
import HealthKit

class MasterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    let kAuthorizeHealthKitSection = 2
    let kProfileSegueIdentifier = "profileSegue"
    let kWorkoutSegueIdentifier = "workoutsSeque"
    
    let healthManager:HealthManager = HealthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        healthManager.setup()



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kProfileSegueIdentifier {
            if let profileViewController = segue.destination as? ProfileViewController {
                profileViewController.healthManager = healthManager
            }
        }
//        }else if segue.identifier == kWorkoutSegueIdentifier {
//            if let workoutViewController = segue.destinationViewController.topViewController as? WorkoutsTableViewController {
//                workoutViewController.healthManager = healthManager;
//            }
//        }
    }
    
    
    func authorizeHealthKit()
    {
        print("TODO: Request HealthKit authorization")
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MasterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MasterCell
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = "Profile and BMI"
            cell.authorButton.isHidden = true
        case 1:
            cell.titleLabel.text = "Workouts"
            cell.authorButton.isHidden = true
        case 2:
            cell.titleLabel.text = ""
            cell.authorButton.setTitle("Authorize HealthKit", for: .normal)
            cell.accessoryType = .none
        default: break
        }

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (0,0): performSegue(withIdentifier: kProfileSegueIdentifier, sender: nil)
        case (kAuthorizeHealthKitSection,0): authorizeHealthKit()
        default: break
        }
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
