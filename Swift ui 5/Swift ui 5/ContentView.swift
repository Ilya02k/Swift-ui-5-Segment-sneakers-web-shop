//
//  ContentView.swift
//  Swift ui 5
//
//  Created by Ann Dosova on 4.05.24.
//

import SwiftUI

struct ContentView: View {
    @State var segmentIndex = 0
    @State var offsetX = 0
    var companies = ["nike", "puma", "reebok"]
    
    var body: some View {
        VStack {
            Text("Snikers: \(companies[segmentIndex])")
                .font(Font.system(.title))
            
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.gray)
                    .padding()
                    .offset(x: CGFloat(offsetX))
                Image(companies[segmentIndex])
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(x: CGFloat(offsetX))
            }.animation(.spring())
            Picker(selection: Binding(get: {
                segmentIndex
            }, set: { newValue in
                segmentIndex = newValue
                self.offsetX = -500
                 moveBack()
            })) {
                ForEach(0..<companies.count,id: \.self) {
                    Text(companies[$0]).tag($0)
                }
            } label: { Text("") }
                .pickerStyle(.segmented)
                .padding()
            Spacer().frame(height: 150)
        }
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            offsetX = 0
        }
    }
}

#Preview {
    ContentView()
}
