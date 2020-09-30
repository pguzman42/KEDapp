//
//  ApiService.swift
//  KEDapp
//
//  Created by Patricio Guzman on 29/09/2020.
//

import Foundation
import Combine

extension Generation {
    var range: Range<Int> {
        switch self {
        case .generation1:
            return 1..<151
        case .generation2:
            return 152..<251
        case .generation3:
            return 252..<386
        case .unknown:
            return 1..<2
        }
    }
}

final class ApiService {

    static let shared = ApiService()

    private var requests = Set<AnyCancellable>()

    func getImage(from url: URL) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .mapError { $0 as Error }
            .map(\.data)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    func getPokemon(generation: Generation) -> AnyPublisher<Pokemon, Never> {
        let randomPokemonNumber = Int.random(in: generation.range)
        var url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
        url.appendPathComponent("\(randomPokemonNumber)")

        let decoder = JSONDecoder()

        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: Pokemon.self, decoder: decoder)
            .replaceError(with: Pokemon.default)
            .eraseToAnyPublisher()
    }
}
