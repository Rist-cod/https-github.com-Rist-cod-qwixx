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
    
    @State var showCross = false
    @State var crossHidden = false
    @State var waarde: [Int: Bool]
    
    init() {
        var dictionary: [Int: Bool] = [:]
        for i in 2...12 {
            dictionary[i] = false
        }
        _waarde = State(initialValue: dictionary)
    }
    
    var body: some View {
        VStack {
            
            //MARK: testing space for views and stuff
            // making a lock in a circle with a greyish background
            HStack(spacing: 2) {
                ZStack{
                    Rectangle()
                        .frame(width: breed, height: hoog)
                    Circle()
                        .frame(width: breed - 10, height: hoog - 10)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.101, brightness: 0.93))
                    Image(systemName: "lock.open")
                    
                }
                
                //MARK: test for square with number
                ZStack {
                    Image(systemName: "square")
                        .resizable()
                        .frame(width: breed, height: hoog)
                    Image(systemName: "square")
                        .resizable()
                        .frame(width: breed - 3 , height: hoog - 3)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.101, brightness: 0.93, opacity: 0.97))
                        .background(Color(hue: 1.0, saturation: 0.101, brightness: 0.93, opacity: 0.97))
                        .cornerRadius(6)
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .onTapGesture{
                            crossHidden.toggle()
                        }
                    
                }
                .frame(width: breed, height: hoog)
                //end of zstack
            }
            
            
            
            //MARK: red first row of numbers
            ZStack {
                Rectangle()
                    .padding(.leading, 20.0)
                    .frame(width: breed * 12.7, height: hoog + 10)
                    .foregroundColor(Color(red: 0.81, green: 0.098, blue: 0.157))
                
                
                HStack(alignment: .center, spacing: 0){
                    Image(systemName: "arrowtriangle.right.fill")
                        .resizable()
                        .padding(.trailing, 3.0)
                        .frame(width: breed-20, height: hoog * 0.5)
                    
                    ForEach(2...12, id: \.self) {
                        number in
                        ZStack {
                            Image(systemName: "square")
                                .resizable()
                                .frame(width: breed, height: hoog)
                                .tag(number)
                            Image(systemName: "square")
                                .resizable()
                                .frame(width: breed - 3 , height: hoog - 3)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.101, brightness: 0.93, opacity: 0.97))
                                .background(Color(hue: 1.0, saturation: 0.101, brightness: 0.93, opacity: 0.97))
                                .cornerRadius(6)
                            Text(String(number))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.811, green: 0.096, blue: 0.157))
                            
                            if waarde[number] == true {
                                Image(systemName: "plus")
                                    .resizable()
                                    .padding(.all, 2.0)
                                    .frame(width: breed, height: hoog)
                                    .rotationEffect(.degrees(45))
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waarde[number] = crossHidden
                                    }
                            } else {
                                Image(systemName: "square.fill")
                                    .resizable()
                                    .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.07))
                                    .frame(width: breed, height: hoog)
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waarde[number] = crossHidden
                                    }
                            }
                            
                        }
                    }
                    ZStack{
                        Circle()
                            .frame(width: breed - 8, height: hoog - 8)
                        Circle()
                            .frame(width: breed - 10, height: hoog - 10)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.101, brightness: 0.93))
                        Image(systemName: "lock.open")
                    }.padding(.leading, 5)
                }
            }.ignoresSafeArea()
            
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
