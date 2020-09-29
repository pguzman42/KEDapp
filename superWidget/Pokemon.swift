//
//  Pokemon.swift
//  KEDapp
//
//  Created by Patricio Guzman on 28/09/2020.
//

import Foundation

extension Pokemon {
    static let `default` = Pokemon(
        abilities: [],
        baseExperience: 1,
        forms: [],
        gameIndices: [],
        height: 1,
        heldItems: [],
        id: 1,
        isDefault: true,
        locationAreaEncounters: "1",
        moves: [],
        name: "Default",
//        order: 1,
//        species: Species(name: "", url: ""),
        sprites: Sprites(
            backDefault: "",
            backFemale: nil,
            backShiny: "",
            backShinyFemale: nil,
            frontDefault: "",
            frontFemale: "",
            frontShiny: "",
            frontShinyFemale: "",
            other: nil,
            versions: nil,
            animated: nil))
//        stats: [],
//        types: [],
//        weight: 1)
}

struct Pokemon: Codable {
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Species]
    let gameIndices: [GameIndex]
    let height: Int
    let heldItems: [HeldItem]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
//    let order: Int
//    let species: Species
    let sprites: Sprites
//    let stats: [Stat]
//    let types: [TypeElement]
//    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, sprites
        //, order, species, sprites, stats, types, weight
    }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

// MARK: - GameIndex
struct GameIndex: Codable {
    let gameIndex: Int
    let version: Species

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

// MARK: - HeldItem
struct HeldItem: Codable {
    let item: Species
    let versionDetails: [VersionDetail]

    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
}

// MARK: - VersionDetail
struct VersionDetail: Codable {
    let rarity: Int
    let version: Species
}

// MARK: - Move
struct Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: - GenerationV
struct GenerationV: Codable {
    let blackWhite: Sprites

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

// MARK: - Versions
struct Versions: Codable {
    let generationI: GenerationI
    let generationIi: GenerationIi
    let generationIii: GenerationIii
    let generationIv: GenerationIv
    let generationV: GenerationV
    let generationVi: [String: GenerationVi]
    let generationVii: GenerationVii
    let generationViii: GenerationViii

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: - Sprites
class Sprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
//    let other: Other?
//    let versions: Versions?
//    let animated: Sprites?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
//        case other, versions, animated
    }

    init(backDefault: String?, backFemale: String?, backShiny: String?, backShinyFemale: String?, frontDefault: String?, frontFemale: String?, frontShiny: String?, frontShinyFemale: String?, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
//        self.other = other
//        self.versions = versions
//        self.animated = animated
    }
}

// MARK: - GenerationI
struct GenerationI: Codable {
    let redBlue, yellow: RedBlue

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

// MARK: - RedBlue
struct RedBlue: Codable {
    let backDefault, backGray, frontDefault, frontGray: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
    }
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    let crystal, gold, silver: Crystal
}

// MARK: - Crystal
struct Crystal: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    let emerald: Emerald
    let fireredLeafgreen, rubySapphire: Crystal

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - Emerald
struct Emerald: Codable {
    let frontDefault, frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - GenerationVi
struct GenerationVi: Codable {
    let frontDefault: String
    let frontFemale: String?
    let frontShiny: String
    let frontShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    let icons: DreamWorld
    let ultraSunUltraMoon: GenerationVi

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String?
    let frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    let icons: DreamWorld
}

// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: Species
}
