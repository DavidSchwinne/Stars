//
//  StarController.swift
//  Stars
//
//  Created by LaFleur on 12/6/19.
//  Copyright © 2019 David Schwinne. All rights reserved.
//

import Foundation

// Source of truth for the app
// CRUD = Create Read Update Delete

class StarController {
    
    init() {
        loadFromPersistentStore()
    }
    
    // Access Control =  the stars array can only be set within the StarController.
    private(set) var stars: [Star] = []
    
    
    
    
    // creates a file inside the document directory of the iphone to save data
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        // /users/LaFleur/Documents/stars.plist
        return documents.appendingPathComponent("stars.plist")
        
    }
    
    
    
   //    Create
   //    @discardableResult - You can call the function without doing anything with the return value.
   //    Throw away the result value if not assigned to anything
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        
        let star = Star(name: name, distance: distance)
        stars.append(star)
        // saves the appended data tot he URL you made below.
        saveToPersistentStore()
        return star
        
    }
    
    // save and load
    func saveToPersistentStore() {
        // creates url to save the data
        guard let url = persistentFileURL else { return }
        
        // this is for the code to try to do something or else logs an error
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        // Data in Plist -> Star 
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
}
