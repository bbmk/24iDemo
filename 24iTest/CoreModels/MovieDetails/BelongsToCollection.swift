//
//  BelongsToCollection.swift
//
//  Created by Bojan Angjeleski on 29.3.22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BelongsToCollection: Codable {

  enum CodingKeys: String, CodingKey {
    case posterPath = "poster_path"
    case backdropPath = "backdrop_path"
    case name
    case id
  }

  var posterPath: String?
  var backdropPath: String?
  var name: String?
  var id: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
