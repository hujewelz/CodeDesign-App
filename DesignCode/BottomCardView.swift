//
//  BottomCardView.swift
//  DesignCode
//
//  Created by luobobo on 2020/3/2.
//  Copyright © 2020 huluobo. All rights reserved.
//

import SwiftUI

struct BottomCardView: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Desion+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            HStack(spacing: 20) {
                RingView(size: CGSize(width: 88, height: 88), percent: 75, show: $show)
                    .animation(Animation.easeInOut.delay(0.3))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("SwiftUI").fontWeight(.bold)
                    Text("9 of 12 sections completed\n10 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            }
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView(show: .constant(true))
    }
}
