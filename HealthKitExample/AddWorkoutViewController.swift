//
//  AddWorkoutViewController.swift
//  HealthKitExample
//
//  Created by Nguyen Nam Long on 10/28/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import UIKit

class AddWorkoutViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    var titleList = ["Date", "Start Time", "Duration(Minutes)"]
    var descriptionList = ["Detail", "Detail"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

extension AddWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 2
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewWorkoutCell") as! NewWorkoutCell
        cell.descriptionLabel.text = "Detail"
        cell.numberTextField.isHidden = true
        switch (indexPath.section, indexPath.row) {
        case (0,0),(0,1):     cell.titleLabel.text = titleList[indexPath.row]
//        case(0,2):
//            cell.titleLabel
//        case(1,0): break
        default: break
            
        }
        return cell
    }
    
}
