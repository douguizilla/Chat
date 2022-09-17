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
    
    @State private var text = ""
    @FocusState private var isFocused
    @State private var messageIDToScroll: UUID?
    
    private let userImageSize: CGFloat = 30
    
    var body: some View {
        VStack(spacing: 0){
            GeometryReader{ proxy in
                ScrollView{
                    ScrollViewReader{ scrollReader in
                        getMessagesView(viewWidth: proxy.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageIDToScroll) { _ in
                                if let messageID = messageIDToScroll {
                                    scrollTo(
                                        messageID: messageID,
                                        shouldAnimate: true,
                                        scrollReader: scrollReader
                                    )
                                }
                            }
                            .onAppear{
                                if let messageID = chat.messages.last?.id {
                                    scrollTo(
                                        messageID: messageID,
                                        anchor: .bottom,
                                        shouldAnimate: true,
                                        scrollReader: scrollReader
                                    )
                                }
                            }
                    }
                    
                }
            }
            .padding(.bottom, 5)
            
            toolbarView()
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: navigationBarLeadingBtn, trailing: navigationBarTrailingBtn)
        .onAppear{
            viewModel.markAsRead(false, chat: chat)
        }
    }
    
    var navigationBarLeadingBtn: some View {
        Button{
            
        }label: {
            HStack(spacing: 10){
                Image(chat.person.imgString)
                    .resizable()
                    .frame(width: userImageSize, height: userImageSize)
                    .clipShape(Circle())
                
                Text(chat.person.name)
                    .foregroundColor(.primary)
            }
        }
    }
    
    var navigationBarTrailingBtn: some View {
        Button{
            
        }label: {
            HStack(spacing: 10){
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: userImageSize, height: userImageSize)
            }
        }
    }
    
    
    
    func scrollTo(
        messageID: UUID,
        anchor: UnitPoint? = nil,
        shouldAnimate: Bool,
        scrollReader: ScrollViewProxy
    ){
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
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
            messageIDToScroll = message.id
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
        NavigationView{
            ChatView(chat: Chat.sampleChat[0])
                .environmentObject(ChatsViewModel())
        }
    }
}
