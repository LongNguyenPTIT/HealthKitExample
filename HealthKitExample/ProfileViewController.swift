//
//  ProfileViewController.swift
//  HealthKitExample
//
//  Created by Nguyen Nam Long on 10/28/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var titleInfo = ["Age","Sex","Blood Type"]
    var titleWeight = ["Weight", "Weight", "Body Mass Index (BMI)"]
    
    
    
    
    var healthManager:HealthManager?
    var bmi:Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 3
        case 2: return 1
        case 3: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        cell.descriptionLabel.text = "Unknown"
        cell.clickButton.isHidden = true
        switch indexPath.section{
        case 0: cell.titleLabel.text = titleInfo[indexPath.row]
        case 1: cell.titleLabel.text = titleWeight[indexPath.row]
        case 2:
            cell.titleLabel.isHidden = true
            cell.descriptionLabel.isHidden = true
            cell.clickButton.isHidden = false
            cell.clickButton.setTitle("Read HealthKit Data", for: .normal)
            cell.clickButton.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        case 3:
            cell.titleLabel.isHidden = true
            cell.descriptionLabel.isHidden = true
            cell.clickButton.isHidden = false
            cell.clickButton.setTitle("Save BMI", for: .normal)
            cell.clickButton.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "USER INFO"
        case 1: return "WEIGHT & HEIGHT"
        default: return ""
        }
    }
    
    

    
    
    
    
    
    
    
    
}
