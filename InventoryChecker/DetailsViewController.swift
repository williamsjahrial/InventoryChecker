//
//  DetailsViewController.swift
//  InventoryChecker
//
//  Created by William Sjahrial on 4/29/17.
//  Copyright © 2017 Mirai Apps. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DetailsViewController: UIViewController {

    @IBOutlet weak var skuLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var item: InventoryItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.item.ref?.observe(.value, with: { snapshot in
            
            self.item = InventoryItem(snapshot: snapshot)
            self.updateUI()
            
        })
        
    }
    
    func updateUI() {
        
        skuLabel.text = item.sku
        nameLabel.text = item.name
        countLabel.text = "\(item.count)"
        
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

    @IBAction func useButtonTapped(_ sender: Any) {
        
        var count = item.count
        if count > 0 {
            count = count - 1
        }
        
        item.ref?.updateChildValues([
            "count": count
            ])
        
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {        
        
        var count = item.count + 1
        
        item.ref?.updateChildValues([
            "count": count
            ])
        
        
    }
}
