//
//  ContentView.swift
//  Chat
//
//  Created by Douglas Gomes on 17/09/22.
//

import SwiftUI

struct ChatListView: View {
    let chats = Chat.sampleChat
    var body: some View {
        NavigationView {
            List {
                ForEach(chats) { chat in
                    ChatRow(chat: chat)
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
