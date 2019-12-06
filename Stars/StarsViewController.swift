//
//  StarsViewController.swift
//  Stars
//
//  Created by LaFleur on 12/6/19.
//  Copyright © 2019 David Schwinne. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {
// MARK - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var distanceTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let starController = StarController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
// MARK - IBActions
    
    @IBAction func printStars(_ sender: UIButton) {
    }
    @IBAction func createStar(_ sender: UIButton) {
        
        guard let name = nameTextField.text,
            let distanceString = distanceTextField.text,
            //      verifies the name, distanceString are not empty, and that the distance is a "Double"
            !name.isEmpty,
            !distanceString.isEmpty,
            let distance = Double(distanceString) else { return }
        
        starController.createStar(named: name, withDistance: distance)
        //        after the star is created in the array, this clears the text fields
        nameTextField.text = ""
        distanceTextField.text = ""
        //        after the star is created in the array, this moves the curser to the name text field.
        nameTextField.becomeFirstResponder()
        tableView.reloadData()
        
    }
    
    
}

extension StarsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns the info from the star controller array to populate the table view
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarTableViewCell else { return UITableViewCell() }
        let star = starController.stars[indexPath.row]
        cell.star = star
        return cell
    }
    
    
    
    
    
    
}
