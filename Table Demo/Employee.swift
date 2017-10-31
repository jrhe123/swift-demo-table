//
//  Employee.swift
//  Table Demo
//
//  Created by Jiarong He on 2017-10-30.
//  Copyright © 2017 Jiarong He. All rights reserved.
//

import Foundation

class Employee: NSObject, NSCoding{
    
    struct Keys {
        static let Name = "name";
        static let LastName = "lastName";
    }
    
    var s = Keys();
    
    private var _name = "";
    private var _lastName = "";
    
    override init() {}
    
    init(name: String, lastName: String) {
        self._name = name;
        self._lastName = lastName;
    }
    
    required init?(coder decoder: NSCoder) {
        if let nameObj = decoder.decodeObject(forKey: Keys.Name) as? String{
            _name = nameObj;
        }
        if let lastNameObj = decoder.decodeObject(forKey: Keys.LastName) as? String{
            _lastName = lastNameObj;
        }
    }
    
    func encode(with coder: NSCoder){
        coder.encode(_name, forKey: Keys.Name);
        coder.encode(_lastName, forKey: Keys.LastName);
    }
    
    var Name: String{
        get {
            return _name;
        }
        set {
            _name = newValue;
        }
    }
    
    var LastName: String{
        get{
            return _lastName;
        }
        set{
            _lastName = newValue;
        }
    }
    
    
    
}

































