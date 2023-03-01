//
//  NetworkManager.swift
//  The Weather App
//
//  Created by Suraphel on 2/28/23.
//

import Foundation

enum APIError: Error{
    case decodingProblem
    case responseProblem
}

func getRequest(city: String, completion: @escaping(Result<WeatherResponse, APIError>)->Void){
    let apiKey = "3206e32d4843afadcebfbc816e4b7cae"
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
    let url = URL(string: baseURL)!
    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print(error.localizedDescription)
            completion(.failure(.responseProblem))
            return
        }
        
        guard let data = data else {
            completion(.failure(.responseProblem))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let feed = try decoder.decode(WeatherResponse.self, from: data)
            completion(.success(feed))
        } catch let jsonErr {
            completion(.failure(.decodingProblem))
            print("Decoding Error:- \(jsonErr.localizedDescription)")
        }
    }
    task.resume()
}
