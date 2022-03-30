//
//  Results.swift
//
//  Created by Bojan Angjeleski on 29.3.22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Results: Codable {

  enum CodingKeys: String, CodingKey {
    case adult
    case overview
    case posterPath = "poster_path"
    case video
    case genreIds = "genre_ids"
    case voteCount = "vote_count"
    case releaseDate = "release_date"
    case originalTitle = "original_title"
    case originalLanguage = "original_language"
    case title
    case backdropPath = "backdrop_path"
    case voteAverage = "vote_average"
    case popularity
    case id
  }

    var adult: Bool?
    var overview: String?
    var posterPath: String?
    var video: Bool?
    var genreIds: [Int]?
    var voteCount: Int?
    var releaseDate: String?
    var originalTitle: String?
    var originalLanguage: String?
    var title: String?
    var backdropPath: String?
    var voteAverage: Float?
    var popularity: Float?
    var id: Int?


    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        //shouldn't be handled here :)
        if let path = posterPath {
            posterPath = "https://image.tmdb.org/t/p/w500" + path
        }
        video = try container.decodeIfPresent(Bool.self, forKey: .video)
        genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
        popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
    
}
