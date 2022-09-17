//
//  ChatRow.swift
//  Chat
//
//  Created by Douglas Gomes on 17/09/22.
//

import SwiftUI

struct ChatRow: View {
    let chat: Chat
    let userImageSize: CGFloat = 70
    let chatRowSize: CGFloat = 80
    let unreadMessagesBadgeSize: CGFloat = 18
    
    var body: some View {
        HStack(spacing: 20){
            Image(chat.person.imgString)
                .resizable()
                .frame(width: userImageSize, height: userImageSize)
                .clipShape(Circle())
            
            ZStack{
                VStack(alignment: .leading, spacing: 5) {
                    HStack{
                        Text(chat.person.name)
                            .bold()
                        
                        Spacer()
                        
                        Text(chat.messages.last?.date.descriptiveString() ?? "")
                    }
                    
                    HStack{
                        Text(chat.messages.last?.text.description ?? "")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                            

                    }
                }
                Circle()
                    .foregroundColor(chat.hasUnreadMessage ? .blue : .clear)
                    .frame(width: unreadMessagesBadgeSize, height: unreadMessagesBadgeSize)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .frame(height: chatRowSize)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[0])
    }
}
