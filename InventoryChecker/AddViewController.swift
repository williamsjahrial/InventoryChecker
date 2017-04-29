//
//  AddViewController.swift
//  InventoryChecker
//
//  Created by William Sjahrial on 4/29/17.
//  Copyright © 2017 Mirai Apps. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddViewController: UIViewController {

    @IBOutlet weak var skuTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ref = FIRDatabase.database().reference(withPath: "inventory-items")
        
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
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        guard let sku = skuTextField.text,
            let name = nameTextField.text else { return }
        
        print("sku: \(sku) name: \(name)")
        
        let item = InventoryItem(sku: sku, name: name)
        
        let itemRef = self.ref.child(sku)
        
        itemRef.setValue(item.toAnyObject())        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
