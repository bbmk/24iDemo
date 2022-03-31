//
//  Results.swift
//
//  Created by Bojan Angjeleski on 31.3.22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Results: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case key
    case site
    case type
    case publishedAt = "published_at"
    case iso31661 = "iso_3166_1"
    case official
    case size
    case name
    case iso6391 = "iso_639_1"
  }

  var id: String?
  var key: String?
  var site: String?
  var type: String?
  var publishedAt: String?
  var iso31661: String?
  var official: Bool?
  var size: Int?
  var name: String?
  var iso6391: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    key = try container.decodeIfPresent(String.self, forKey: .key)
    site = try container.decodeIfPresent(String.self, forKey: .site)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
    iso31661 = try container.decodeIfPresent(String.self, forKey: .iso31661)
    official = try container.decodeIfPresent(Bool.self, forKey: .official)
    size = try container.decodeIfPresent(Int.self, forKey: .size)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    iso6391 = try container.decodeIfPresent(String.self, forKey: .iso6391)
  }

}
