//
//  ChatRow.swift
//  Chat
//
//  Created by Douglas Gomes on 17/09/22.
//

import SwiftUI

struct ChatRow: View {
    
    let userImageSize: CGFloat = 70
    let chatRowSize: CGFloat = 80
    
    var body: some View {
        HStack(spacing: 20){
            Image("img1")
                .resizable()
                .frame(width: userImageSize, height: userImageSize)
                .clipShape(Circle())
            
            ZStack{
                VStack(alignment: .leading, spacing: 5) {
                    HStack{
                        Text("Andrej")
                            .bold()
                        
                        Spacer()
                        
                        Text("11/7/2022")
                    }
                    
                    HStack{
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)

                    }
                    
                    
                }
            }
        }
        .frame(height: chatRowSize)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow()
    }
}
