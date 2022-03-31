//
//  MovieVideos.swift
//
//  Created by Bojan Angjeleski on 31.3.22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MovieVideos: Codable {

  enum CodingKeys: String, CodingKey {
    case results
    case id
  }

  var results: [Results]?
  var id: Int?


  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    results = try container.decodeIfPresent([Results].self, forKey: .results)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
