//
//  NewNotesTableViewController.swift
//  Проба
//
//  Created by Карина on 17.01.2023.
//

import UIKit

//MARK: - NewNotesTableViewController
final class NewNotesTableViewController: UITableViewController {
    
    //MARK: - Property
    var notes = Notes(name: "", description: "")
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var textView: UITextView!
    
    //MARK: - Ovverride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let name = nameTextField.text ?? ""
        let description = textView.text ?? ""
        
        notes = Notes(name: name, description: description)
    }
    
    //MARK: - Private Func
    private func updateUI() {
        nameTextField.text = notes.name
        textView.text = notes.description
    }
    
    
    
}
