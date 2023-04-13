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
    
    //rijen
    var optelRij = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var aftrekRij = [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
    
    //waarden per kleur (dictionary)
    @State var waardeRood: [Int: Bool]
    @State var waardeGeel: [Int: Bool]
    @State var waardeGroen: [Int: Bool]
    @State var waardeBlauw: [Int: Bool]
    
    //vars voor de scores --> optellen van waarden die waar zijn per kleur
    @State var countRed = 0
    @State var countYellow = 0
    @State var countGreen = 0
    @State var countBlue = 0
    
    //variabelen voor de eindscores
    @State var pointsRed = 0
    @State var pointsYellow = 0
    @State var pointsGreen = 0
    @State var pointsBlue = 0
    
    //rijgesloten
    @State var roodGesloten = false
    @State var geelGesloten = false
    @State var groenGesloten = false
    @State var blauwGesloten = false
    
    //puntentelling
    var aantalKeer = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var punten = [1: 1, 2: 3, 3: 6, 4: 10, 5: 15, 6: 21, 7: 28, 8: 36, 9: 45, 10: 55, 11: 66, 12: 78]
    
    
    init() {
        //init waarde van iedere waarde binnen de dictionarys op false zetten
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
            //            HStack(spacing: 2) {
            //                ZStack{
            //                    Rectangle()
            //                        .frame(width: breed, height: hoog)
            //                    Circle()
            //                        .frame(width: breed - 10, height: hoog - 10)
            //                        .foregroundColor(Color(hue: 1.0, saturation: 0.101, brightness: 0.93))
            //                    Image(systemName: "lock.open")
            //
            //                }
            //
            //                //MARK: test for square with number
            //                ZStack {
            //                    Image(systemName: "square")
            //                        .resizable()
            //                        .frame(width: breed, height: hoog)
            //                    Image(systemName: "square")
            //                        .resizable()
            //                        .frame(width: breed - 3 , height: hoog - 3)
            //                        .foregroundColor(Color(hue: 1.0, saturation: 0.101, brightness: 0.93, opacity: 0.97))
            //                        .background(Color(hue: 1.0, saturation: 0.101, brightness: 0.93, opacity: 0.97))
            //                        .cornerRadius(6)
            //                    Text("2")
            //                        .font(.largeTitle)
            //                        .fontWeight(.bold)
            //                        .foregroundColor(.red)
            //                        .onTapGesture{
            //                            crossHidden.toggle()
            //                        }
            //
            //                }
            //                .frame(width: breed, height: hoog)
            //                //end of zstack
            //            }
            
            
            
            //MARK: red first row of numbers
            ZStack {
                // achtergrond kleur
                Rectangle()
                    .padding(.leading, 20.0)
                    .frame(width: breed * 12.7, height: hoog + 10)
                    .foregroundColor(Color(red: 0.81, green: 0.098, blue: 0.157))
                
                // hstack horizontaal weergeven van de vakjes
                HStack(alignment: .center, spacing: 0){
                    Image(systemName: "arrowtriangle.right.fill")
                        .resizable()
                        .padding(.trailing, 3.0)
                        .frame(width: breed-20, height: hoog * 0.5)
                    
                    //ieder vakje met daarin een nummer
                    ForEach(optelRij, id: \.self) {
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
                            }
                            // actie genereren wanneer je op een vakje tikt, rekening houden met of de rij niet gesloten is
                        }.onTapGesture {
                            if roodGesloten != true{
                                crossHidden.toggle()
                                waardeRood[number] = crossHidden
                                countRed = waardeRood.values.filter{ $0 }.count
                                if countRed > 0{
                                    pointsRed = punten[countRed] ?? 0
                                }
                            }
                        }
                    }
                    
                    // slotje rechts
                    ZStack{
                        Circle()
                            .frame(width: breed - 8, height: hoog - 8)
                        Circle()
                            .frame(width: breed - 10, height: hoog - 10)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.101, brightness: 0.93))
                        
                        if roodGesloten == true {
                            Image(systemName: "lock.slash")
                        }
                        else {
                            Image(systemName: "lock.open")
                        }
                    }
                    .onTapGesture {
                        if countRed >= 5{
                            roodGesloten.toggle()
                        }}
                    .padding(.leading, 5)
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
                    
                    ForEach(optelRij, id: \.self) {
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
 
                            }
                            
                        }                                   .onTapGesture {
                            crossHidden.toggle()
                            waardeGeel[number] = crossHidden
                            countYellow = waardeGeel.values.filter{ $0 }.count
                        }
                    }
                    ZStack{
                        Circle()
                            .frame(width: breed - 8, height: hoog - 8)
                        Circle()
                            .frame(width: breed - 10, height: hoog - 10)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.101, brightness: 0.93))
                        if geelGesloten == true {
                            Image(systemName: "lock.slash")
                        }
                        else {
                            Image(systemName: "lock.open")
                        }
                    }
                    .onTapGesture {
                        geelGesloten.toggle()
                    }
                    .padding(.leading, 5)
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
                    
                    ForEach(aftrekRij, id: \.self) {
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
                        if groenGesloten == true {
                            Image(systemName: "lock.slash")
                        }
                        else {
                            Image(systemName: "lock.open")
                        }
                    }
                    .onTapGesture {
                        groenGesloten.toggle()
                    }
                    .padding(.leading, 5)
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
                    
                    ForEach(aftrekRij, id: \.self) {
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
                        if blauwGesloten == true {
                            Image(systemName: "lock.slash")
                        }
                        else {
                            Image(systemName: "lock.open")
                        }
                    }
                    .onTapGesture {
                        blauwGesloten.toggle()
                    }
                    .padding(.leading, 5)
                }
            }.ignoresSafeArea()
            
            //MARK: gray background with points en crosses and failed throws
            HStack(spacing: 5){
                Text("aantal kruisjes rood")
                Text(String(countRed))
                Text("punten rood")
                Text(String(pointsRed))
                Text(String(countYellow))
                Text(String(countGreen))
                Text(String(countBlue))

            }
            //MARK: score count and total
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
