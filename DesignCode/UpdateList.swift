//
//  UpdateList.swift
//  DesignCode
//
//  Created by luobobo on 2020/3/3.
//  Copyright © 2020 huluobo. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
            List(updateData) { update in
                NavigationLink(destination: Text("Detail")) {
                    UpdateRow(update: update)
                }
            }
            .navigationBarTitle("Updates")
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct UpdateRow: View {
    var update: Update
    
    var body: some View {
        HStack {
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color.black)
                .cornerRadius(20)
                .padding(.trailing, 4)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(update.title)
                    .font(.system(size: 20, weight: .bold))
                Text(update.text)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Text(update.date)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI Advanced", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS", date: "JAN 1"),
    Update(image: "Card2", title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17"),
    Update(image: "Card3", title: "ProtoPie", text: "Quickly prototype advanced animations and interaction for mobile and Web.", date: "AUG 27"),
]
