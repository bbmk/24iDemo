//
//  CasheHelper.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 30.3.22.
//

import Foundation

func encodeObject<T:Codable>(object: T, path: String) {
    do {
        // Create JSON Encoder
        let encoder = JSONEncoder()

        // Encode Note
        let data = try encoder.encode(object)

        // Write/Set Data
        UserDefaults.standard.set(data, forKey: path)

    } catch {
        print("Unable to Encode Note (\(error))")
    }
}

func decodeObject<T: Codable>(object: T.Type, path: String) -> T? {
    if let data = UserDefaults.standard.data(forKey: path) {
        do {
            // Create JSON Decoder
            let decoder = JSONDecoder()
            
            // Decode Note
            let note = try decoder.decode(T.self, from: data)
            return note
            
        } catch {
            print("Unable to Decode Note (\(error))")
        }
        
    }
    return nil
}
