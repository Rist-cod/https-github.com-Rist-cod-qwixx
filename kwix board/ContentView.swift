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
    
    @State var crossHidden = false
    @State var waardeRood: [Int: Bool]
    @State var waardeGeel: [Int: Bool]
    @State var waardeGroen: [Int: Bool]
    @State var waardeBlauw: [Int: Bool]
    
    init() {
        var dictionaryRood: [Int: Bool] = [:]
        for i in 2...12 {
            dictionaryRood[i] = false
        }
        _waardeRood = State(initialValue: dictionaryRood)
        
        var dictionaryGeel: [Int: Bool] = [:]
        for i in 2...12 {
            dictionaryGeel[i] = false
        }
        _waardeGeel = State(initialValue: dictionaryGeel)
        
        var dictionaryGroen: [Int: Bool] = [:]
        for i in 2...12 {
            dictionaryGroen[i] = false
        }
        _waardeGroen = State(initialValue: dictionaryGroen)
        
        var dictionaryBlauw: [Int: Bool] = [:]
        for i in 2...12 {
            dictionaryBlauw[i] = false
        }
        _waardeBlauw = State(initialValue: dictionaryBlauw)
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
                            
                            if waardeRood[number] == true {
                                Image(systemName: "plus")
                                    .resizable()
                                    .padding(.all, 2.0)
                                    .frame(width: breed, height: hoog)
                                    .rotationEffect(.degrees(45))
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waardeRood[number] = crossHidden
                                    }
                            } else {
                                Image(systemName: "square.fill")
                                    .resizable()
                                    .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.07))
                                    .frame(width: breed, height: hoog)
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waardeRood[number] = crossHidden
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
            ZStack {
                Rectangle()
                    .padding(.leading, 20.0)
                    .frame(width: breed * 12.7, height: hoog + 10)
                    .foregroundColor(Color(red: 0.995, green: 0.848, blue: 0.028))
                
                
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
                                .foregroundColor(Color(red: 1.0, green: 0.979, blue: 0.903))
                                .background(Color(red: 1.0, green: 0.979, blue: 0.903))
                                .cornerRadius(6)
                            Text(String(number))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.996, green: 0.846, blue: 0.027))
                            
                            if waardeGeel[number] == true {
                                Image(systemName: "plus")
                                    .resizable()
                                    .padding(.all, 2.0)
                                    .frame(width: breed, height: hoog)
                                    .rotationEffect(.degrees(45))
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waardeGeel[number] = crossHidden
                                    }
                            } else {
                                Image(systemName: "square.fill")
                                    .resizable()
                                    .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.07))
                                    .frame(width: breed, height: hoog)
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waardeGeel[number] = crossHidden
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
            
            //MARK: green third row of numbers
            ZStack {
                Rectangle()
                    .padding(.leading, 20.0)
                    .frame(width: breed * 12.7, height: hoog + 10)
                    .foregroundColor(Color(red: 0.0, green: 0.676, blue: 0.309))
                
                
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
                                .foregroundColor(Color(red: 1.0, green: 0.979, blue: 0.903))
                                .background(Color(red: 1.0, green: 0.979, blue: 0.903))
                                .cornerRadius(6)
                            Text(String(number))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: -0.02, green: 0.676, blue: 0.307))
                            
                            if waardeGroen[number] == true {
                                Image(systemName: "plus")
                                    .resizable()
                                    .padding(.all, 2.0)
                                    .frame(width: breed, height: hoog)
                                    .rotationEffect(.degrees(45))
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waardeGroen[number] = crossHidden
                                    }
                            } else {
                                Image(systemName: "square.fill")
                                    .resizable()
                                    .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.07))
                                    .frame(width: breed, height: hoog)
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waardeGroen[number] = crossHidden
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
            
            //MARK: blue fourth row of numbers
            ZStack {
                Rectangle()
                    .padding(.leading, 20.0)
                    .frame(width: breed * 12.7, height: hoog + 10)
                    .foregroundColor(Color(red: 0.006, green: 0.343, blue: 0.627))
                
                
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
                                .foregroundColor(Color(red: 1.0, green: 0.979, blue: 0.903))
                                .background(Color(red: 1.0, green: 0.979, blue: 0.903))
                                .cornerRadius(6)
                            Text(String(number))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.009, green: 0.341, blue: 0.628))
                            
                            if waardeBlauw[number] == true {
                                Image(systemName: "plus")
                                    .resizable()
                                    .padding(.all, 2.0)
                                    .frame(width: breed, height: hoog)
                                    .rotationEffect(.degrees(45))
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waardeBlauw[number] = crossHidden
                                    }
                            } else {
                                Image(systemName: "square.fill")
                                    .resizable()
                                    .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.07))
                                    .frame(width: breed, height: hoog)
                                    .onTapGesture {
                                        crossHidden.toggle()
                                        waardeBlauw[number] = crossHidden
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
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
