//
//  Category.swift
//  Todoey
//
//  Created by Daryl Corbett on 18-09-19.
//  Copyright © 2019 Daryl Corbett. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    
    let items = List<Item>()
    
}
