//
//  CatRowView.swift
//  catApp
//
//  Created by оля on 23.04.2020.
//  Copyright © 2020 Olya. All rights reserved.
//

import SwiftUI

struct CatRowView: View {
    var cat: Cat
    
    var body: some View {
        Text("\(cat.name)")
    }
}
