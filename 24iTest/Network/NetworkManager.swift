//
//  NetworkManager.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 29.3.22.
//

import Foundation

class DataManager {
    
    static let shared = DataManager(dataRepo: DataRepo(networkData: NetworkDataService(), chashedData: NetworkDataService()))
    let dataRepo: DataRepo

    private init(dataRepo: DataRepo) {
        self.dataRepo = dataRepo
    }
}
