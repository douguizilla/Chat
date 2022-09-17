//
//  ChatView.swift
//  Chat
//
//  Created by Douglas Gomes on 17/09/22.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatsViewModel
    
    let chat : Chat
    var body: some View {
        VStack(spacing: 0){
            GeometryReader{ proxy in
                ScrollView{
                    getMessagesView(viewWidth: proxy.size.width)
                }
            }
            .background(
                Color.yellow
            )
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.markAsRead(false, chat: chat)
        }
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView(viewWidth: CGFloat)->some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(chat.messages){ message in
                HStack{
                    Text(message.text)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: Chat.sampleChat[0])
            .environmentObject(ChatsViewModel())
    }
}
