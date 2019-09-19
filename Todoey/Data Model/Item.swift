//
//  Item.swift
//  Todoey
//
//  Created by Daryl Corbett on 18-09-19.
//  Copyright © 2019 Daryl Corbett. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
