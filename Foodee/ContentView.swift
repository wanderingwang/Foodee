//
//  ContentView.swift
//  Foodee
//
//  Created by 黄硕 on 03.10.25.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""   // what the user types
    @State private var messages: [String] = []  // history of messages

    var body: some View {
        VStack {
            // Chat messages shown as a list
            List(messages, id: \.self) { msg in
                Text(msg)
            }

            HStack {
                TextField("Type your question...", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button("Send") {
                    sendMessage()
                }
                .padding(.trailing)
            }
        }
    }

    func sendMessage() {
        guard !userInput.isEmpty else { return }
        messages.append("You: \(userInput)")
        // For now, fake a response
        messages.append("App: Thinking about '\(userInput)'...")
        userInput = ""
    }
}

#Preview {
    ContentView()
}

