//
//  UpdateList.swift
//  DesignCode
//
//  Created by luobobo on 2020/3/3.
//  Copyright © 2020 huluobo. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        UpdateRow(update: update)
                    }
                }
                .onDelete { index in
                    self.store.removeUpdate(at: index.first!)
                }
            }
            .navigationBarTitle("Updates")
            .navigationBarItems(leading: Button(action: {
                
            }, label: {
                Image(systemName: "plus")
                    .imageScale(.large)
            }))
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
