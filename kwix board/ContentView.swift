//
//  ContentView.swift
//  kwix board
//
//  Created by Rick  Struijs on 13/04/2023.
//

import SwiftUI

var breed: CGFloat = 50
var hoog: CGFloat = breed

struct ContentView: View {
    var body: some View {
        VStack {
            
            
            //MARK: red first row of numbers
            HStack(alignment: .top){
                ForEach(2...12, id: \.self) {
                    number in
                    Image(systemName: String(number) + ".circle")
                        .resizable()
                        .frame(width: breed, height: hoog)
                        .foregroundColor(.red)
                }
            }
            
            //MARK: yellow second row of numbers
            HStack(alignment: .top){
                ForEach(2...12, id: \.self) {
                    number in
                    Image(systemName: String(number) + ".circle")
                        .resizable()
                        .frame(width: breed, height: hoog)
                        .foregroundColor(.yellow)
                }
            }
            
            //MARK: green third row of numbers
            HStack(alignment: .top){
                ForEach(2...12, id: \.self) {
                    number in
                    Image(systemName: String(number) + ".circle")
                        .resizable()
                        .frame(width: breed, height: hoog)
                        .foregroundColor(.green)
                }
            }
            
            //MARK: blue fourth row of numbers
            HStack(alignment: .top){
                ForEach(2...12, id: \.self) {
                    number in
                    Image(systemName: String(number) + ".circle")
                        .resizable()
                        .frame(width: breed, height: hoog)
                        .foregroundColor(.blue)
                }
            }
            
        }
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
