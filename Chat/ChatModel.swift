//
//  ChatModel.swift
//  Chat
//
//  Created by Douglas Gomes on 17/09/22.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person : Person
    var messages: [Message]
    var hasUnreadMessage: Bool = false
}

struct Person: Identifiable {
    let id: UUID = UUID()
    let name: String
    let imgString: String
}

struct Message : Identifiable {
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    enum MessageType {
        case Sent, Received
    }
    
    init(_ text: String, type: MessageType, date: Date = Date()){
        self.date = date
        self.type = type
        self.text = text
    }
    
}

extension Chat {
    static let sampleChat = [
        Chat(person: Person(name: "Douglas", imgString: "img1"), messages: [
            Message("Hey Douglas", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Toc-toc", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Quenhé?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Mario...", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Que Mario? '------'", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("eita...", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Mario Bros haha", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1))
        ]),
        Chat(person: Person(name: "Yago", imgString: "img2"), messages: [
            Message("Hey Yago", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Toc-toc", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Quenhé?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("A vontade", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Que vontade? '------'", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("A vontade de fazer aquele bolo", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("FAZ!!!", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1))
        ]),
        Chat(person: Person(name: "Gilmar", imgString: "img3"), messages: [
            Message("Hey Gilmar", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Toc-toc", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Quenhé?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("A cer", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Que cer?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("A cerveja que você vai comprar pra mim", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("haha é serio, vai la", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1))
        ]),
        Chat(person: Person(name: "Tiago", imgString: "img4"), messages: [
            Message("Hey Yago", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Não sei contar piada :/", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Então só pesquisa alguma piada ai e me manda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Tá. Pera ai", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 10)),
            Message("Ok", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("eita... esqueci", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("percebi", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1))
        ]),
        Chat(person: Person(name: "Lucas", imgString: "img5"), messages: [
            Message("Hey Lucas", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Alexa, conte uma piada", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Você sabe que eu não vou ouvir o que ela falar ne?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Ah, é vdd. Deixa eu ver se tem como colocar ela pra escrever aqui no chat.", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Jesus, da um pouco de paz pra ela coitada", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Oxe, pq?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Ocupa a coitada o tempo todo, parece divida de jogo", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1))
        ]),
        Chat(person: Person(name: "Popo", imgString: "img6"), messages: [
            Message("Hey Popo", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Quem é a maior cantora da atualizade?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Quenhé?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Demê Lovatê", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Aham", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Oxe, to falando serio", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Vocalista da geração", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1))
        ]),
        Chat(person: Person(name: "Matheus", imgString: "img7"), messages: [
            Message("Hey Matheus", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Quem é a maior cantora da atualizade?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Quenhé?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Madonna", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("kkkkkkkkkkkkkkkkkkkkkkkkkkkk muito boa essa", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Tchau popo", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Realmente ele quem respondeu o chat", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1))
        ]),
        Chat(person: Person(name: "Gustavo", imgString: "img8"), messages: [
            Message("Hey Gustavo", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Acabou o chá", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("kkkkkkkkkkkkkkkkkk", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("...", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("até parece", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("ave, me conhece mesmo", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Sim kkkkk a piada foi boa", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3))
        ]),
        Chat(person: Person(name: "Perilo", imgString: "img9"), messages: [
            Message("Hey Perilo", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 9)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 9)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 9)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 8)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 8)),
            Message("Toc-toc", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 7)),
            Message("Quenhé?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 7)),
            Message("Esqueci a piada", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 6)),
            Message("kkkkkkk ok", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 6)),
            Message("depois te conto uma boa", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("Foi mal", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5))
        ]),
        Chat(person: Person(name: "Thor", imgString: "img10"), messages: [
            Message("Hey Thor", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 8)),
            Message("Tô fazendo um chat, mas é muito dificil, você pode me ajudar?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 8)),
            Message("Pfvr eu preciso da sua ajuda", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 8)),
            Message("Ooopa, posso sim. Como?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 7)),
            Message("Me conta alguma piada?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 7)),
            Message("Au-au", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 7)),
            Message("Que?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 6)),
            Message("Eu sou um cachorro", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 6)),
            Message("Ah ta", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 6)),
            Message("au-au.", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("Tchau", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5))
        ])
        
        
    ]
}


