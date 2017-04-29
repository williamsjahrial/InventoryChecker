//
//  ViewController.swift
//  InventoryChecker
//
//  Created by William Sjahrial on 4/29/17.
//  Copyright © 2017 Mirai Apps. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var startButton: UIView!
    
    var ref: FIRDatabaseReference!
    
    var items: [InventoryItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Inventory Checker"
        
        ref = FIRDatabase.database().reference(withPath: "inventory-items")
        
        ref.observe(.value, with: { snapshot in
            
            var newItems: [InventoryItem] = []
            
            for child in snapshot.children {
                let item = InventoryItem(snapshot: child as! FIRDataSnapshot)
                newItems.append(item)
            }
            
            self.items = newItems
            self.tableView.reloadData()
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let item = self.items[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.sku) \(item.count) units"
        
        return cell
        
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "DetailsSegue", sender: indexPath)
        
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = items[indexPath.row]
            item.ref?.removeValue()
        }
    }
    
    // MARK: - ACTIONS

    @IBAction func addButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "AddSegue", sender: nil)
    }
    
    // MARK: - SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailsSegue" {
            
            let indexPath = sender as! IndexPath
            
            let vc = segue.destination as! DetailsViewController
            vc.item = items[indexPath.row]
            
        }
        
    }

}

