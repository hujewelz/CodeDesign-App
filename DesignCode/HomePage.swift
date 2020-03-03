//
//  Home.swift
//  DesignCode
//
//  Created by luobobo on 2020/3/3.
//  Copyright © 2020 huluobo. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    @State var showProfile = false
    @State var menuState = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
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
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(.degrees(showProfile ? Double(menuState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.white.opacity(0.001))
                .offset(y: showProfile ? 0 : 600)
                .offset(y: menuState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
            }
            .gesture(
                DragGesture().onChanged {
                    self.menuState = $0.translation
                }
                .onEnded { _ in
                    if self.menuState.height > 50 {
                        self.showProfile = false
                    }
                    self.menuState = .zero
                }
            )
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
