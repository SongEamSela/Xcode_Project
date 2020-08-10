//
//  GetUsers.swift
//  FetchDataAPI
//
//  Created by SongEam Sela on 8/10/20.
//  Copyright © 2020 SongEam Sela. All rights reserved.
//

import Foundation
class GetUsers {
    static func getUsers() -> [UserModel]{
        
        var results = [UserModel]()
        
        guard let url = URL(string: "https://reqres.in/api/users?page=1") else {
            print("Invalid URL")
            return []
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(ResponseModel.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        results = decodedResponse.data ?? []
                        print (results.count)
                    }
                    
                    // everything is good, so we can exit
                    return
                }
            }
            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        return results
    }
}
