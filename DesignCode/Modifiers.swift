//
//  Modifiers.swift
//  DesignCode
//
//  Created by luobobo on 2020/3/7.
//  Copyright © 2020 huluobo. All rights reserved.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}
