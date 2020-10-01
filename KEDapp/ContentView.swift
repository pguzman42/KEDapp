//
//  ContentView.swift
//  KEDapp
//
//  Created by Patricio Guzman on 28/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State var stringToDisplay: String = "Hello, world!"
    var body: some View {
        Text(stringToDisplay)
            .padding()
            .onOpenURL(perform: { url in
                stringToDisplay = url.path
            })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
