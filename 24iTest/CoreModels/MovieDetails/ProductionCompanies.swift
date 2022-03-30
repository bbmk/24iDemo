//
//  ProductionCompanies.swift
//
//  Created by Bojan Angjeleski on 29.3.22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ProductionCompanies: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case originCountry = "origin_country"
    case logoPath = "logo_path"
  }

  var id: Int?
  var name: String?
  var originCountry: String?
  var logoPath: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    originCountry = try container.decodeIfPresent(String.self, forKey: .originCountry)
    logoPath = try container.decodeIfPresent(String.self, forKey: .logoPath)
  }

}
