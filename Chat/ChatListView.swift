//
//  ContentView.swift
//  Chat
//
//  Created by Douglas Gomes on 17/09/22.
//

import SwiftUI

struct ChatListView: View {
    
    @StateObject var viewModel = ChatsViewModel()
    
    @State private var query = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.getSortedFilteredChats(query: query)) { chat in
                    ChatRow(chat: chat)
                        .overlay(
                            NavigationLink(destination: {
                                ChatView(chat: chat)
                                    .environmentObject(viewModel)
                            }){
                                EmptyView()
                            }
                                .frame(width: 0)
                                .opacity(0)
                        )
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                viewModel.markAsRead(!chat.hasUnreadMessage, chat: chat)
                            } label: {
                                if chat.hasUnreadMessage {
                                    Label("Read", systemImage: "text.bubble")
                                }else{
                                    Label("Unread", systemImage: "circle.fill")
                                }
                            }
                            .tint(.blue)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                }
            }
            .searchable(text: $query)
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
