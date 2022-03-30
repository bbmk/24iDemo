//
//  MovieDetails.swift
//
//  Created by Bojan Angjeleski on 29.3.22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MovieDetails: Codable {

  enum CodingKeys: String, CodingKey {
    case title
    case popularity
    case tagline
    case originalLanguage = "original_language"
    case productionCountries = "production_countries"
    case revenue
    case imdbId = "imdb_id"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case spokenLanguages = "spoken_languages"
    case overview
    case genres
    case posterPath = "poster_path"
    case id
    case runtime
    case budget
    case status
    case video
    case adult
    case homepage
    case backdropPath = "backdrop_path"
    case releaseDate = "release_date"
    case productionCompanies = "production_companies"
    case belongsToCollection = "belongs_to_collection"
    case originalTitle = "original_title"
  }

  var title: String?
  var popularity: Float?
  var tagline: String?
  var originalLanguage: String?
  var productionCountries: [ProductionCountries]?
  var revenue: Int?
  var imdbId: String?
  var voteAverage: Float?
  var voteCount: Int?
  var spokenLanguages: [SpokenLanguages]?
  var overview: String?
  var genres: [Genres]?
  var posterPath: String?
  var id: Int?
  var runtime: Int?
  var budget: Int?
  var status: String?
  var video: Bool?
  var adult: Bool?
  var homepage: String?
  var backdropPath: String?
  var releaseDate: String?
  var productionCompanies: [ProductionCompanies]?
  var belongsToCollection: BelongsToCollection?
  var originalTitle: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
    tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    productionCountries = try container.decodeIfPresent([ProductionCountries].self, forKey: .productionCountries)
    revenue = try container.decodeIfPresent(Int.self, forKey: .revenue)
    imdbId = try container.decodeIfPresent(String.self, forKey: .imdbId)
    voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    spokenLanguages = try container.decodeIfPresent([SpokenLanguages].self, forKey: .spokenLanguages)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    genres = try container.decodeIfPresent([Genres].self, forKey: .genres)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
    budget = try container.decodeIfPresent(Int.self, forKey: .budget)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    productionCompanies = try container.decodeIfPresent([ProductionCompanies].self, forKey: .productionCompanies)
    belongsToCollection = try container.decodeIfPresent(BelongsToCollection.self, forKey: .belongsToCollection)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
  }

}
