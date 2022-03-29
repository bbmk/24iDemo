//
//  NetworkService.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "Not found."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

class NetworkService {
    
    class func request<T:Codable>(router: NetworkRouter, completion: @escaping(T) ->(), errorCompletion: @escaping(_ error: Error) -> ()) {
        let session = URLSession(configuration: .default)
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.port = router.port
        components.path = router.path
        components.queryItems = router.parameters
//        components.percentEncodedQuery = components.percentEncodedQuery?
//            .replacingOccurrences(of: "+", with: "%2B")
//            .replacingOccurrences(of: ":", with: "%3A")
        
        guard let url = components.url else {return}
        let urlRequest = setupRequest(url: url, router: router)
        let dataTask = session.dataTask(with: urlRequest) {data, response, error in
            
            if error != nil {
                errorCompletion(error!)
            }
            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        let error = NSError(domain:"", code:response.statusCode, userInfo:[ NSLocalizedDescriptionKey: NetworkResponse.noData.rawValue])
                        errorCompletion(error)
                        return
                    }
                    do {
                        let responseObject = try JSONDecoder().decode(T.self, from: responseData)
                        DispatchQueue.main.async {
                            completion(responseObject)
                        }
                    }catch {
                        let error = NSError(domain:"", code:response.statusCode, userInfo:[ NSLocalizedDescriptionKey: NetworkResponse.unableToDecode.rawValue])
                        errorCompletion(error)
                    }
                case .failure(let networkFailureError):
                    let error = NSError(domain:"", code:response.statusCode, userInfo:[ NSLocalizedDescriptionKey: networkFailureError])
                    errorCompletion(error)
                }
            }
            
        }
        dataTask.resume()
    }
    //when we expect jsonArray
    class func request<T:Codable>(router: NetworkRouter, completion: @escaping([T]) ->(), errorCompletion: @escaping(_ error: Error) -> ()) {
        let session = URLSession(configuration: .default)
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.port = router.port
        components.path = router.path
//        components.queryItems = router.parameters
//        components.percentEncodedQuery = components.percentEncodedQuery?
//            .replacingOccurrences(of: "+", with: "%2B")
//            .replacingOccurrences(of: ":", with: "%3A")
    
        guard let url = components.url else {return}
        let urlRequest = setupRequest(url: url, router: router)
        let dataTask = session.dataTask(with: urlRequest) {data, response, error in
            
            if error != nil {
                errorCompletion(error!)
            }
            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        let error = NSError(domain:"", code:response.statusCode, userInfo:[ NSLocalizedDescriptionKey: NetworkResponse.noData.rawValue])
                        errorCompletion(error)
                        return
                    }
                    do {
                        let responseObject = try JSONDecoder().decode([T].self, from: responseData)
                        DispatchQueue.main.async {
                            completion(responseObject)
                        }
                    }catch {
                        let error = NSError(domain:"", code:response.statusCode, userInfo:[ NSLocalizedDescriptionKey: NetworkResponse.unableToDecode.rawValue])
                        errorCompletion(error)
                    }
                case .failure(let networkFailureError):
                    let error = NSError(domain:"", code:response.statusCode, userInfo:[ NSLocalizedDescriptionKey: networkFailureError])
                    errorCompletion(error)
                }
            }
        }
        dataTask.resume()
    }
    
    class func setupRequest(url:URL,router:NetworkRouter) ->(URLRequest) {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        //urlRequest.httpBody = router.httpBody
     //   urlRequest.setValue(router.accessToken, forHTTPHeaderField: "authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
        return urlRequest
    }
    
    class func handleNetworkResponse(_ response: HTTPURLResponse) ->  Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
}
