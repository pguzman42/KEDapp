//
//  ApiService.swift
//  KEDapp
//
//  Created by Patricio Guzman on 29/09/2020.
//

import Foundation
import Combine

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

    func getPokemon() -> AnyPublisher<Pokemon, Never> {
        let randomPokemonNumber = Int.random(in: 1..<151)
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
