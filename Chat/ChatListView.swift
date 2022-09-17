//
//  ContentView.swift
//  Chat
//
//  Created by Douglas Gomes on 17/09/22.
//

import SwiftUI

struct ChatListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< 10) { i in
                    ChatRow()
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        
                    }label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
