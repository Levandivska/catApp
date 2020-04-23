//
//  FullCatInfo.swift
//  catApp
//
//  Created by оля on 23.04.2020.
//  Copyright © 2020 Olya. All rights reserved.
//

import SwiftUI
import Combine

struct FullCatInfo: View {
    var cat: Cat
    
    var body: some View {
        VStack (alignment: .leading){
            Text("\(cat.name)")
                .font(Font.title)
            
            Image(uiImage: UIImage(data: cat.photo)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .clipped()
                .cornerRadius(15)

            Text("\n" + "origin: " )
                       .bold()
                       + Text("\(cat.origin)")
            
            Text("\n" + "description: " )
                .bold()
                + Text("\(cat.description)")
            
            Text("\n" + "temperament: " )
                .bold()
                + Text("\(cat.temperament)")
            
            VStack{
                RatingItemView(ratingItemName: "adaptability", ratingCur: cat.adaptability)
                RatingItemView(ratingItemName: "angry level" , ratingCur: cat.angryLevel)
                RatingItemView(ratingItemName: "child friendly", ratingCur: cat.childFriendly)
                RatingItemView(ratingItemName: "health issues", ratingCur: cat.healthIssues)
                RatingItemView(ratingItemName: "social needs", ratingCur: cat.socialNeeds)
            }.padding(.top, 10)

        }.padding()
    }
}

//let mycat1 = Cat(name: "American Bobtail", temperament: "Intelligent, Interactive, Lively, Playful, Sensitive", origin: "United States", adaptability: 5, childFriendly: 4, angryLevel: 3, socialNeeds: 3, healthIssues: 1, description: "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.", photo: <#Data#>)
//
//struct FullCatInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        FullCatInfo(cat: mycat1)
//    }
//}
