//
//  Cat.swift
//  catApp
//
//  Created by оля on 23.04.2020.
//  Copyright © 2020 Olya. All rights reserved.
//

import Foundation

struct Cat: Identifiable{
    let id = UUID()
    
    public var name: String
    public var temperament: String
    public var origin: String
    public var adaptability: Int
    public var childFriendly: Int
    public var angryLevel: Int
    public var socialNeeds: Int
    public var healthIssues: Int
    public var description: String
    public var photo: Data
}
