//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Daryl Corbett on 17-09-19.
//  Copyright © 2019 Daryl Corbett. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

//    var itemArray = [Item]()
    var categories = [Category]()
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This print command will show us the path to our data file
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

        loadCategories()
        
    }
    
    
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
//        let category = categories[indexPath.row]
//        cell.textLabel?.text = category.name
// Angela used the following line instead of the previous two lines
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
        
    }

    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
            
        }
    }
    
    
    
    
    
    
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //what will happen once the user clicks the Add Category button on our UIAlert
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            self.categories.append(newCategory)
            
            self.saveCategories()
            
        }
        
        alert.addTextField { (field) in
            textField.placeholder = "Create new category"
            textField = field
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

    
    
    
    
    
    
    
    
    //MARK: - Model Manipulation Methods
    
    func saveCategories() {
        
        do {
            try context.save()
        }
        catch {
            print("Error saving category \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        
        do {
            categories = try context.fetch(request)
        }
        catch {
            print("Error fetching data from categories \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    



    
    
    
    
    
    
    
    
    
    
    

    
    

    
    
    
    
}