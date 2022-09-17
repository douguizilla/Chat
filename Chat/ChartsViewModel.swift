//
//  ChartsViewModel.swift
//  Chat
//
//  Created by Douglas Gomes on 17/09/22.
//

import Foundation

class ChatsViewModel : ObservableObject {
    
    @Published var chats = Chat.sampleChat
    
    func getSortedFilteredChats(query: String) -> [Chat] {
        let sortedCharts = chats.sorted{
            guard let date1 = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return date1 > date2
        }
        
        if query == "" {
            return sortedCharts
        }
        
        return sortedCharts.filter{
            $0.person.name.lowercased().contains(query.lowercased())
        }
    }
}
