//
//  AppDelegate.swift
//  Todoey
//
//  Created by Daryl Corbett on 11-09-19.
//  Copyright © 2019 Daryl Corbett. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//This print line can be used to find the location of the Realm file
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
//            let realm = try Realm()   //The following line is equivilant to this line
            _ = try Realm()
            
        }
        catch {
            print("Error initialising new realm, \(error)")
        }
        
        
        return true
    }



}

