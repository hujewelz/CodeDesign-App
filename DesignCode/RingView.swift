//
//  RingView.swift
//  DesignCode
//
//  Created by luobobo on 2020/3/7.
//  Copyright © 2020 huluobo. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var size: CGSize = CGSize(width: 44, height: 44)
    var percent: CGFloat = 80
    var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2 = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = size.width / 44
        let lineWidth = 5 * multiplier
        let progress = 1 - percent / 100
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: lineWidth))
                .frame(width: size.width, height: size.height)
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]),
                                   startPoint: .topTrailing,
                                   endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: lineWidth,
                                       lineCap: .round,
                                       lineJoin: .round,
                                       miterLimit: .infinity,
                                       dash: [20, 0],
                                       dashPhase: 0)
                )
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .frame(width: size.width, height: size.height)
                .shadow(color: Color(color2).opacity(0.2), radius: 3 * multiplier, x: 0, y: 0)
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
