//
//  SpokenLanguages.swift
//
//  Created by Bojan Angjeleski on 29.3.22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct SpokenLanguages: Codable {

  enum CodingKeys: String, CodingKey {
    case englishName = "english_name"
    case name
    case iso6391 = "iso_639_1"
  }

  var englishName: String?
  var name: String?
  var iso6391: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    englishName = try container.decodeIfPresent(String.self, forKey: .englishName)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    iso6391 = try container.decodeIfPresent(String.self, forKey: .iso6391)
  }

}
