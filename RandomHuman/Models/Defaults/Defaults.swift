//
//  Defaults.swift
//  RandomHuman
//
//  Created by Guerson Perez on 01/04/21.
//

import Foundation

struct Defaults {
    
    static func setString(_ string: String?, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.setValue(string, forKey: key)
    }
    
    static func setInt(_ int: Int, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(int, forKey: key)
    }

    static func setBool(_ bool: Bool, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(bool, forKey: key)
    }
    
    static func setDate(_ date: Date?, for key: String) {
        let defaults = UserDefaults.standard
        defaults.setValue(date, forKey: key)
    }
    
    static func setObject(_ object: Any?, forKey key: String){
        let defaults = UserDefaults.standard
        defaults.set(object, forKey: key)
    }
    
    static func stringForKey(_ key: String) -> String? {
        UserDefaults.standard.string(forKey: key)
    }
    
    static func intForKey(_ key: String) -> Int{
        UserDefaults.standard.integer(forKey: key)
    }
    
    static func boolForKey(_ key: String) -> Bool{
        UserDefaults.standard.bool(forKey: key)
    }
    
    static func dateForKey(_ key: String) -> Date? {
        guard let value = UserDefaults.standard.value(forKey: key), let date = value as? Date else {
            return nil
        }
        return date
    }
    
    static func floatForKey(_ key: String) -> Float{
        let defaults = UserDefaults.standard
        return defaults.float(forKey: key)
    }
    
    static func doubleForKey(_ key: String) -> Double{
        let defaults = UserDefaults.standard
        return defaults.double(forKey: key)
    }
    
    static func objectForKey(_ key: String) -> Any{
        let defaults = UserDefaults.standard
        if let val = defaults.object(forKey: key){
            return val
        }else{
            return NSObject.init()
        }
    }
    
    static func dictionaryForKey(_ key: String) -> Dictionary<String, Any>{
        let defaults = UserDefaults.standard
        if let val = defaults.dictionary(forKey: key){
            return val
        }else{
            return [:]
        }
    }
    
    static func arrayForKey(_ key: String) -> Array<Any>{
        let defaults = UserDefaults.standard
        if let val = defaults.array(forKey: key){
            return val
        }else{
            return []
        }
    }
}
