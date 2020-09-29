//
//  EntryFactory.swift
//  KEDapp
//
//  Created by Patricio Guzman on 29/09/2020.
//

import Foundation
import Combine

final class EntryFactory {
    private var requests = Set<AnyCancellable>()
    func makeSimpleEntry(completion: @escaping (SimpleEntry) -> Void) {

        let getPokemonShared = ApiService
            .shared
            .getPokemon()
            .share()

        let getImage = getPokemonShared
            .compactMap { $0.sprites.frontDefault }
            .compactMap(URL.init)
            .flatMap { ApiService.shared.getImage(from: $0) }
            .replaceError(with: Data())

        Publishers
            .Zip(getPokemonShared, getImage)
            .sink { (pokemon, data) in
            completion(SimpleEntry(
                        date: Date(),
                        pokemon: pokemon,
                        pokemonImageData: data)
            )
        }.store(in: &requests)
    }
}
