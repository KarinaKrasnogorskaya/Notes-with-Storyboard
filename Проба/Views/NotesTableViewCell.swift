//
//  NotesTableViewCell.swift
//  Проба
//
//  Created by Карина on 17.01.2023.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(object: Notes) {
        self.nameLabel.text = object.name
        self.descriptionLabel.text = object.description
    }

}
