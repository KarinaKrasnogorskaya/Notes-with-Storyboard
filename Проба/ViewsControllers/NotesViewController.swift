//
//  NotesViewController.swift
//  Проба
//
//  Created by Карина on 17.01.2023.
//

import UIKit

//MARK: - NotesViewController
final class NotesViewController: UITableViewController {
    
    //MARK: - Property
    private var objects = [
        Notes(name: "Как стать хорошим програмистом?", description: "Нужно много учиться"),
        Notes(name: "Как попасть на стажировку?", description: "Нужно много практики")
    ]
    private var filtretedObjects = [Notes]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    //MARK: - Ovverride Method
    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavigationBar()
        
        
        
    }
    //MARK: - Setting Navigation Bar
    private func settingNavigationBar() {
        self.title = "Заметки"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder  = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    
    //MARK: - Segue
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        let sourseVC = segue.source as! NewNotesTableViewController
        let notes = sourseVC.notes
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            objects[selectedIndexPath.row] = notes
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
            let newIndexPath = IndexPath(row: objects.count, section: 0)
            objects.append(notes)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "edit" else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            let object: Notes
            
            if isFiltering {
                object = filtretedObjects[indexPath.row]
            } else {
                object = objects[indexPath.row]
            }
            let note = object
            let navigationVC = segue.destination as! UINavigationController
            let newNotesVC = navigationVC.topViewController as! NewNotesTableViewController
            newNotesVC.notes = note
            newNotesVC.title = "Edit"
        }
        
    }
    
    //MARK: - Ovverride Table Metods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filtretedObjects.count
        }
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotesTableViewCell
        
        var object: Notes
        
        if isFiltering {
            object = filtretedObjects[indexPath.row]
        } else {
            object = objects[indexPath.row]
        }
        
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
    
    
    
}

//MARK: - NotesViewController: UISearchResultsUpdating 
extension NotesViewController: UISearchResultsUpdating {
     func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
     func filterContentForSearchText(_ searchText: String) {
        filtretedObjects = objects.filter({ (object: Notes) -> Bool in
            return object.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}



