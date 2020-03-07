//
//  TabBar.swift
//  DesignCode
//
//  Created by luobobo on 2020/3/7.
//  Copyright © 2020 huluobo. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomePage().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
