//
//  BaseClass.swift
//
//  Created by Bojan Angjeleski on 29.3.22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct PopularMovies: Codable {

  enum CodingKeys: String, CodingKey {
    case page
    case totalResults = "total_results"
    case totalPages = "total_pages"
    case results
  }

  var page: Int?
  var totalResults: Int?
  var totalPages: Int?
  var results: [Movies]?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    page = try container.decodeIfPresent(Int.self, forKey: .page)
    totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
    results = try container.decodeIfPresent([Movies].self, forKey: .results)
  }

}
