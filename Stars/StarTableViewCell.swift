//
//  StarTableViewCell.swift
//  Stars
//
//  Created by LaFleur on 12/6/19.
//  Copyright © 2019 David Schwinne. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    // sets a var to set the updateViews
    var star: Star? {
        didSet {
            updateViews()
        }
        
    }
    
    private func updateViews() {
        guard let star = star else { return }
        
        // sets the text of both labels to the info from the Star Array
        nameLabel.text = star.name
        distanceLabel.text = "\(star.distance) light years away"
    }
    
}
