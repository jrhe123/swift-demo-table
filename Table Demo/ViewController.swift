//
//  ViewController.swift
//  Table Demo
//
//  Created by Jiarong He on 2017-10-29.
//  Copyright © 2017 Jiarong He. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private var data = [Employee]();
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.loadData();
    }
    
    // back from modal
    override func viewDidAppear(_ animated: Bool) {
        self.loadData();
        myTableView.reloadData();
    }

    
    
    // save data
    var filePath: String{
        let manager = FileManager.default;
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first;
        return url!.appendingPathComponent("Data").path;
    }
    
    private func saveData(employee: Employee){
        data.append(employee);
        NSKeyedArchiver.archiveRootObject(data, toFile: filePath);
    }
    
    private func loadData(){
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Employee]{
            data = ourData;
        }
    }
    
    
    
    // add employee
    @IBAction func addEmployee(_ sender: Any) {
        
        // alert
        let alert = UIAlertController(title: "Add New Employee", message: "Enter Employee's Name", preferredStyle: .alert);
        
        // btn
        let save = UIAlertAction(title: "Save", style: .default){
            (alertAction: UIAlertAction) in
            
            let name = alert.textFields?[0].text!;
            let lastName = alert.textFields?[1].text!;
            let newEmployee = Employee(name: name!, lastName: lastName!);
            
            // save data
            self.saveData(employee: newEmployee);
            self.myTableView.reloadData();
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil);
        
        // text fields:
        alert.addTextField(configurationHandler: nil);
        alert.addTextField(configurationHandler: nil);
        alert.addAction(save);
        alert.addAction(cancel);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    
    // edit employee
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let destination = segue.destination as? EditDataVC{
            
            if let index = sender as? Int{
                
                destination.index = index;
                destination.data = data;
                destination.path = filePath;
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = tableView.indexPathForSelectedRow!.row;
        performSegue(withIdentifier: "EditSegue", sender: index);
    }
    
    
    
    
    // delegate func
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
        cell.textLabel?.text = data[indexPath.row].Name;
        cell.detailTextLabel?.text = data[indexPath.row].LastName;
        
        return cell;
    }
    
    
    // enable edit table view
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    // delete item
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            // delete & save data
            data.remove(at: indexPath.row);
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath);
            
            tableView.deleteRows(at: [indexPath], with: .automatic);
        }
    }
    
    
    
    
    
    
    
}

