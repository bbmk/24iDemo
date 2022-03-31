//
//  VideoIdHelper.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 31.3.22.
//

import Foundation


func extractTrailerId(movieVideos: MovieVideos) -> String? {
    if let item = movieVideos.results?.filter({($0.name?.lowercased().contains("trailer" ) ?? false) && $0.site?.lowercased() == "youtube"}),
       let movie = item.first {
        return movie.key
    }
    return nil
}
