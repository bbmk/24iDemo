//
//  NetworkRouter.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

enum NetworkRouter {
    case getPopularMoviesList
    case getMovieDetails(movieId: String)
    case getMovieVideos(movieId: String)
    //should be stored in keychain !!
    var accessToken: String {
        switch self {
        case .getPopularMoviesList, .getMovieDetails, .getMovieVideos:
            return "03a9dfd3c42397a31ca7ef7c0d4529fb"
        }
    }
    
    var scheme: String {
        return "https"
        // it can be extended
//        switch self {
//        case .getPopularMoviesList, .getMovieDetails:
//            return "https"
//        default:
//            return "http"
//        }
    }
    
    var host: String {
        // It can be easy adapted for multiple hosts
        let baseSport = "api.themoviedb.org"
        switch self {
        case .getPopularMoviesList, .getMovieDetails, .getMovieVideos:
            return baseSport
        }
    }
    
    var port: Int? {
        return nil
    }
    
    var stringParameters: String {
        switch self {
        case .getMovieDetails(let movieId):
            return movieId
        case .getPopularMoviesList:
            return ""
        case .getMovieVideos(let movieId):
            return movieId
        }
    }
    
    var parameters: [URLQueryItem] {
        return [URLQueryItem(name: "api_key", value: accessToken)]
        // Can be modified for multiple accessKeys/ tokens
//        switch self {
//        case .getPopularMoviesList, .getMovieDetails:
//            return [URLQueryItem(name: "api_key", value: accessToken)]
//        default :
//            return []
//
//        }
    }
    
    //    var httpBody: Data? {
    //
    //    }
    
    var path: String {
        switch self {
        case .getPopularMoviesList:
            return "/3/movie/popular"
        case .getMovieDetails:
            return "/3/movie/" + stringParameters
        case .getMovieVideos:
            return "/3/movie/" + stringParameters + "/videos"
        }
    }
    
    var method: String {
        switch self {
        case .getPopularMoviesList, .getMovieDetails, .getMovieVideos:
            return "GET"
        }
    }
}
