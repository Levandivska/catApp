//
//  RatingItemView.swift
//  catApp
//
//  Created by оля on 23.04.2020.
//  Copyright © 2020 Olya. All rights reserved.
//

import SwiftUI

struct RatingItemView: View {
    let ratingItemName: String
    let ratingCur: Int
        
    var body: some View {
        HStack {
            Text("\(self.ratingItemName)")
                .bold()
            Spacer()
            ForEach(1...5, id: \.self) { rateImg in
                Image(systemName: self.chooseStar(rate: rateImg))
            }
        }
    }
    
    func chooseStar(rate: Int) -> String{
        if rate <= self.ratingCur {return "star.fill"}
        return "star"
    }
}

struct RatingItemView_Previews: PreviewProvider {
    static var previews: some View {
        RatingItemView(ratingItemName: "frendly", ratingCur: 1)
    }
}
