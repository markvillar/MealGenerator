//
//  ContentView.swift
//  MealGenerator
//
//  Created by Mark on 08/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var mealGenerator = MealGenerator()
    
    
    var actionButton: some View {
        
        VStack {
            Button("Get Random Meal") {
                mealGenerator.fetchRandomMeal()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(16)
            .onAppear {
                mealGenerator.fetchRandomMeal()
            }
        }
        
        
    }
    
    var body: some View {
        ScrollView {
            VStack {
                
                if let name = mealGenerator.currentMeal?.name {
                    Text(name)
                        .font(.largeTitle)
                }
                
                AsyncImageView(urlString: $mealGenerator.currentImageURLString)
                
                if let ingredients = mealGenerator.currentMeal?.ingredients {
                    HStack {
                        Text("Ingredients")
                            .font(.title2)
                        Spacer()}
                    ForEach(ingredients, id: \.self) { ingredient in
                        HStack {
                            Text(ingredient.name + " - " + ingredient.measure)
                            Spacer()
                        }
                    }
                    
                }
                
                actionButton
                
                if let instructions = mealGenerator.currentMeal?.instructions {
                    VStack {
                        Text("Instructions")
                            .font(.title2)
                            .padding(.bottom)
                        Text(instructions)
                    }.padding()
                }
                
            }
            .padding()
            
            actionButton
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
