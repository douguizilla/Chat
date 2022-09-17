//
//  ChatView.swift
//  Chat
//
//  Created by Douglas Gomes on 17/09/22.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatsViewModel
    @State private var text = ""
    @FocusState private var isFocused
    
    let chat : Chat
    var body: some View {
        VStack(spacing: 0){
            GeometryReader{ proxy in
                ScrollView{
                    getMessagesView(viewWidth: proxy.size.width)
                        .padding(.horizontal)
                }
            }
            .background(
                Color.yellow
            )
            
            toolbarView()
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.markAsRead(false, chat: chat)
        }
    }
    
    func toolbarView() -> some View {
        VStack{
            let height: CGFloat = 37
            HStack{
                TextField("Message...", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
                Button {
                    sendMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(minWidth: height, minHeight: height)
                        .background(
                            Circle()
                                .foregroundColor(text.isEmpty ? .gray : .blue)
                        )
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
    func sendMessage(){
        if let message = viewModel.sendMessage(text, in: chat){
            text = ""
        }
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView(viewWidth: CGFloat)->some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(chat.messages){ message in
                let isReceived = message.type == .Received
                HStack{
                    ZStack{
                        Text(message.text)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(
                                isReceived ? Color.black.opacity(0.2) : .green.opacity(0.9)
                            )
                            .cornerRadius(13)
                    }
                    .frame(width: viewWidth * 0.7, alignment:  isReceived ? .leading : .trailing)
                    .padding(.vertical)
//                    .background(Color.blue)
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: isReceived ? .leading : .trailing
                )
                .id(message.id)
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
