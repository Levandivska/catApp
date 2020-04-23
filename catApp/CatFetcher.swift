//
//  CatFetcher.swift
//  catApp
//
//  Created by оля on 23.04.2020.
//  Copyright © 2020 Olya. All rights reserved.
//

import Foundation


public class CatFetcher: ObservableObject {
    @Published var cats = [Cat]()
    var breadIDs = [String]()

    let catInfoUrl = "https://api.thecatapi.com/v1/images/search?breed_ids="
    let catBreadsUrl = "https://api.thecatapi.com/v1/breeds"
    
    init(){
        load()
    }
    
    func load(){
        let session = URLSession.shared
        let url = URL(string: catBreadsUrl)!
        var request = URLRequest(url: url)
        request.addValue("6ebb5bbf-7aa3-4387-96da-1ffb8712b8a5", forHTTPHeaderField: "x-api-key")
        
        session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data
            {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    if  let object = json as? [Any] {
                        
                        for anItem in object as! [Dictionary<String, AnyObject>] {
                            let breadsID = anItem["id"] as! String
                            self.breadIDs += [breadsID]
                            self.loadCatsData(breadId: breadsID)
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }).resume()
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func loadCatsData(breadId: String){
        let session = URLSession.shared
        let url = URL(string: catInfoUrl + breadId)!
        var request = URLRequest(url: url)
        request.addValue("6ebb5bbf-7aa3-4387-96da-1ffb8712b8a5", forHTTPHeaderField: "x-api-key")

        session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data
            {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])

                    guard let object = json as? [Any]
                        else { return }
                    
       
                    
                    for anItem in object as! [Dictionary<String, AnyObject>] {

                        guard let fullDct = anItem["breeds"] as? [Dictionary<String, AnyObject>]
                            else {return}
                          
                        let dct = fullDct[0]
    
                        let name = dct["name"] as! String
                        let temp = dct["temperament"] as! String
                        let origin = dct["origin"] as! String

                        let adaptability = dct["adaptability"] as! Int
                        let childFriendly = dct["child_friendly"] as! Int
                        let angryLevel = dct["energy_level"] as! Int
                        let socialNeeds = dct["social_needs"] as! Int
                        let healthIssues = dct["health_issues"] as! Int

                        let description = dct["description"] as! String
                 
                        let urll = anItem["url"] as? String
                        self.getData(from: URL(string: urll!)!) { data, response, error in
                            guard let data = data, error == nil else { return }
                            let photo = data
                            let cat = Cat(name: name, temperament: temp, origin: origin, adaptability: adaptability, childFriendly: childFriendly, angryLevel: angryLevel, socialNeeds: socialNeeds, healthIssues: healthIssues, description: description, photo: photo)
                                DispatchQueue.main.async {
                                        self.cats += [cat]
                            }
                        }

                    }
                } catch {
                    print(error)
                }
            }
        }).resume()
    }
}
