//
//  NotesTableViewCell.swift
//  Проба
//
//  Created by Карина on 17.01.2023.
//

import UIKit

//MARK: - NotesTableViewCell
final class NotesTableViewCell: UITableViewCell {
    
    //MARK: - Property
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    //MARK: - Ovverride Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        settingLabel()
    }
    
//MARK: -  Methods
     func set(object: Notes) {
        self.nameLabel.text = object.name
        self.descriptionLabel.text = object.description
    }
    
     func settingLabel() {
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
    }

}
