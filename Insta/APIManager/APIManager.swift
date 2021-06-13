//
//  APIManager.swift
//  Insta
//
//  Created by Aravind on 13/06/21.
//

import Foundation

enum NetworkError: Error {
    case failedRequest
    case badURL

}


class APIManager: NSObject {
    
    
    static var shared = APIManager()
    
    let baseURL = "https://api.imgur.com/"
    let clientID = "63860f424df587c"
    
    typealias ImageListCompletion =  (Result<ImageList, NetworkError>) -> Void

    
    override init() {
        super.init()
    }
    
    func getTopPhotos(completion: @escaping ImageListCompletion){
        let url = baseURL + "3/gallery/top/time/day/1"
        var urlRequest:URLRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: urlRequest){data,response,error in
            if let data = data {
               do {
                    let imageList:ImageList = try JSONDecoder().decode(ImageList.self, from: data)

                completion(.success(imageList))
               } catch let error {
                  print(error)
                completion(.failure(.failedRequest))
               }
            }
            
        }
        task.resume()
    }
    
    func getHotPhotos(completion: @escaping ImageListCompletion){
        let url = baseURL + "3/gallery/hot/time/day/1"
        var urlRequest:URLRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: urlRequest){data,response,error in
            if let data = data {
               do {
                
                let imageList:ImageList = try JSONDecoder().decode(ImageList.self, from: data)
              

                completion(.success(imageList))
               } catch let error {
                  print(error)
                completion(.failure(.failedRequest))

               }
            }
            
        }
        task.resume()
    }
    
    func getUserPhotos(completion: @escaping ImageListCompletion){
        let url = baseURL + "3/gallery/user/time/day/1"
        var urlRequest:URLRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: urlRequest){data,response,error in
            print(response as Any)
            if let data = data {
               do {
                    let imageList:ImageList = try JSONDecoder().decode(ImageList.self, from: data)

                completion(.success(imageList))
               } catch let error {
                  print(error)
                completion(.failure(.failedRequest))

               }
            }
            
        }
        task.resume()
    }
   
    func getRandomPhotos(completion: @escaping ImageListCompletion){
        let url = baseURL + "3/gallery/random/random/1"
        var urlRequest:URLRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: urlRequest){data,response,error in
            print(response as Any)
            if let data = data {
               do {
                    let imageList:ImageList = try JSONDecoder().decode(ImageList.self, from: data)

                completion(.success(imageList))
               } catch let error {
                  print(error)
                completion(.failure(.failedRequest))

               }
            }
            
        }
        task.resume()
    }
}
