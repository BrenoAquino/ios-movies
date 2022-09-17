//
//  File.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

#if DEBUG
import Foundation
import Domain

public extension Domain.Movie {
    static let `default`: Movie = .init(
        name: "Collateral Beauty",
        overview: "Howard entra em depressão após uma tragédia pessoal e passa a escrever cartas para a Morte, o Tempo e o Amor, algo que preocupa seus amigos. Mas o que parece impossível, se torna realidade quando essas três partes do universo decidem responder. Morte, Tempo e Amor vão tentar ensinar o valor da vida para Howard.",
        poster: "/l7rwGxhH2ZDaViuxzT0qMPfhfo3.jpg",
        backposter: "/iovi35nPfjbYTw2gRo7uImWblRU.jpg"
    )
}
#endif
