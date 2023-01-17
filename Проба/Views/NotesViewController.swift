//
//  NotesViewController.swift
//  Проба
//
//  Created by Карина on 17.01.2023.
//

import UIKit

class NotesViewController: UITableViewController {

    var objects = [
    Notes(name: "Как выучить язык Swift?", description: "Практика, практика и еще раз практика"),
    Notes(name: "Как попасть на стажировку?", description: "Только методом проб и ошибок")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Заметки"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
       
        

        
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        let sourseVC = segue.source as! NewNotesTableViewController
        let notes = sourseVC.notes
        let newIndexPath = IndexPath(row: objects.count, section: 0)
        objects.append(notes)
       
        tableView.insertRows(at: [newIndexPath], with: .fade)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotesTableViewCell
        let object = objects[indexPath.row]
        cell.set(object: object)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveNotes = objects.remove(at: sourceIndexPath.row)
        objects.insert(moveNotes, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
