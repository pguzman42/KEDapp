//
//  superWidget.swift
//  superWidget
//
//  Created by Patricio Guzman on 28/09/2020.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {

    var entryFactory = EntryFactory()

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), pokemon: nil, pokemonImageData: nil)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), pokemon: nil, pokemonImageData: nil)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        entryFactory.makeSimpleEntry { entry in
            let period = Calendar.current.date(byAdding: .minute, value: 2, to: Date())!
            completion(Timeline(entries: [entry], policy: .after(period)))
        }
    }
}

enum PokemonError: Error {
    case notSuchPokemonExists
    case apiError
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let pokemon: Pokemon?
    let pokemonImageData: Data?
}

struct ErrorEntry: TimelineEntry {
    let date: Date
    let error: PokemonError?
}

struct PlaceHolderEntry: TimelineEntry {
    let date: Date
}

struct superWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            if let dataImage = entry.pokemonImageData,
               let image = UIImage(data: dataImage),
               let name = entry.pokemon?.name {
                Image(uiImage: image).resizable()
                VStack {
                    Spacer()
                    HStack() {
                        Spacer()
                        Text(name).foregroundColor(.black).fontWeight(.bold)
                    }
                }.padding()
            } else { Text("Something went wrong") }
        }
    }
}

@main
struct superWidget: Widget {
    let kind: String = "superWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            superWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .supportedFamilies([.systemSmall,.systemMedium,.systemLarge])
        .description("This is an example widget.")
    }
}

struct superWidget_Previews: PreviewProvider {
    static var previews: some View {
        superWidgetEntryView(entry: SimpleEntry(date: Date(), pokemon: Pokemon.default, pokemonImageData: nil))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
