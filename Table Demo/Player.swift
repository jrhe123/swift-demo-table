//
//  Player.swift
//  Table Demo
//
//  Created by Jiarong He on 2017-10-29.
//  Copyright © 2017 Jiarong He. All rights reserved.
//

import UIKit

class Player{
    
    private var _health = 100;
    private var _power = 200;
    
    init() {
        
    }
    
    init(health: Int, power: Int){
        self._health = health;
        self._power = power;
    }
    
    var Health: Int {
        get {
            return _health;
        }
        set {
            _health = newValue;
        }
    }
    
    var Power: Int {
        get {
            return _power;
        }
        set {
            _power = newValue;
        }
    }
    
    func attack(){
        print("called");
    }
    
}



// Inheritance
class Wizard: Player {
    
    override init() {
        super.init();
    }
    
    override init(health: Int, power: Int) {
        super.init(health: health, power: power);
    }
    
    override func attack() {
        print("overrided");
    }
}




















