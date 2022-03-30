//
//  ProductionCountries.swift
//
//  Created by Bojan Angjeleski on 29.3.22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ProductionCountries: Codable {

  enum CodingKeys: String, CodingKey {
    case iso31661 = "iso_3166_1"
    case name
  }

  var iso31661: String?
  var name: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    iso31661 = try container.decodeIfPresent(String.self, forKey: .iso31661)
    name = try container.decodeIfPresent(String.self, forKey: .name)
  }

}
