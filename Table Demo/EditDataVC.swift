//
//  EditDataVC.swift
//  Table Demo
//
//  Created by Jiarong He on 2017-10-30.
//  Copyright © 2017 Jiarong He. All rights reserved.
//

import UIKit

class EditDataVC: UIViewController {
    
    
    var data = [Employee]();
    var path = "";
    var index = 0;
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtName.text = data[index].Name;
        txtLastName.text = data[index].LastName;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil);
    }
    
    @IBAction func editData(_ sender: Any) {
        
        txtName.isEnabled = true;
        txtLastName.isEnabled = true;
    }
    
    @IBAction func commitChange(_ sender: Any) {
        
        if txtName.text != "" && txtLastName.text != "" {
            data[index].Name = txtName.text!;
            data[index].LastName = txtLastName.text!;
            
            NSKeyedArchiver.archiveRootObject(data, toFile: path);
            
            txtName.isEnabled = false;
            txtLastName.isEnabled = false;
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

}
