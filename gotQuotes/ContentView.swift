//
//  ContentView.swift
//  gotQuotes
//
//  Created by Raissa Parente on 04/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var quote: Quote?
    @State var bgColor = Color.indigo
    let colors: [Color] = [.black, .red, .blue, .green, .orange, .mint, .pink, .purple, .cyan, .yellow]
    
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            
            VStack (spacing: 50) {
                Image(systemName: "quote.opening")
                    .resizable()
                    .frame(width: 120, height: 80, alignment: .topLeading)
                    .foregroundColor(.white)
                
                Text(quote?.sentence ?? "random quote")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                
                Image(systemName: "quote.closing")
                    .resizable()
                    .frame(width: 120, height: 80, alignment: .topLeading)
                    .foregroundColor(.white)
                
                Text(quote?.character.name ?? "name")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
            }
            .padding(40)
            .task {
                do {
                    quote = try await fetchQuoteFromAPI()
                } catch {
                    print("error")
                }
            }
        }
        .onTapGesture {
            bgColor = colors.randomElement()!
            Task {
                quote = try await fetchQuoteFromAPI()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

