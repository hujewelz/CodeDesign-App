//
//  HomeView.swift
//  DesignCode
//
//  Created by luobobo on 2020/3/3.
//  Copyright © 2020 huluobo. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
                Button(action: {
                    self.showProfile.toggle()
                }) {
                    Image("Avatar")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 36.0, height: 36.0)
                        .clipShape(Circle())
                }
                
                Button(action: { self.showUpdate.toggle() }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    .degrees(Double(geometry.frame(in: .global).minX - 30) / -20),
                                    axis: (x: 0, y: 10, z: 0)
                            )
                        }
                        .frame(width: 270, height: 270)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(true))
    }
}

struct SectionView: View {
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(width: 160, alignment: .leading)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
        .frame(width: 275, height: 275)
        .background(section.backgroundColor)
        .cornerRadius(30)
        .shadow(color: section.backgroundColor.opacity(0.2), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var backgroundColor: Color
}

let sectionData: [Section] = [
    Section(title: "Prototype designs in SwiftUI",
            text: "18 Sections",
            logo: "Logo1",
            image: Image("Card1"),
            backgroundColor: Color("card1")),
    Section(title: "Buidl a SwiftUI app",
            text: "20 Sections",
            logo: "Logo2",
            image: Image("Card2"),
            backgroundColor: Color("card2")),
    Section(title: "SwiftUI Advanced",
            text: "24 Sections",
            logo: "Logo3",
            image: Image("Card3"),
            backgroundColor: Color("card3")),
]
