//
//  AfricanfoodService.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//

import Foundation
import Combine

class AfricanFoodService: ObservableObject {
    @Published var foods: [AfricanFood] = []
    @Published var isLoading: Bool = false
    
    
    private let mockFoods: [AfricanFood] = [
        
        
        AfricanFood(
            name: "Sadza",
            description: "Zimbabwe's staple food made from cornmeal, similar to polenta",
            ingredients: [
                Ingredient(name: "Cornmeal (mealie meal)", quantity: 2, unit: "cups"),
                Ingredient(name: "Water", quantity: 4, unit: "cups"),
                Ingredient(name: "Salt", quantity: 1, unit: "tsp")
            ],
            preparationTime: "30 minutes",
            region: "Southern Africa",
            imageURL: "https://i.pinimg.com/736x/52/18/97/52189721a8b946319c9395cef42ee225.jpg",
            cookingInstructions: [
                "Boil water with a pinch of salt",
                "Gradually add cornmeal while stirring",
                "Cook for 20–25 minutes, stirring constantly",
                "Serve hot with vegetables or meat"
            ],
            defaultServings: 2
        ),
        AfricanFood(
            name: "Coconut Rice",
            description: "Fragrant West African rice cooked with coconut milk, spices, and seafood",
            ingredients: [
                Ingredient(name: "Long-grain rice", quantity: 2, unit: "cups"),
                Ingredient(name: "Coconut milk", quantity: 1, unit: "can"),
                Ingredient(name: "Bell pepper", quantity: 1, unit: "large"),
                Ingredient(name: "Curry powder", quantity: 1, unit: "tbsp"),
                Ingredient(name: "Salt", quantity: 1, unit: "tsp"),
                Ingredient(name: "Shrimp or chicken (optional)", quantity: 200, unit: "g")
            ],
            preparationTime: "1 hour",
            region: "West Africa",
            imageURL: "https://cheflolaskitchen.com/wp-content/uploads/2015/10/Coconut-Rice-6-1-scaled.jpg.webp",
            cookingInstructions: [
                "Sauté onions in coconut oil",
                "Add blended peppers and spices",
                "Pour in coconut milk and stock, then add rice",
                "Simmer until rice is tender and creamy"
            ],
            defaultServings: 2
        ),
        AfricanFood(
            name: "Mopani Worms",
            description: "Traditional Zimbabwean delicacy stir-fried with spices and tomatoes",
            ingredients: [
                Ingredient(name: "Mopani worms", quantity: 400, unit: "g"),
                Ingredient(name: "Shallot (chopped)", quantity: 1, unit: "piece"),
                Ingredient(name: "Tomatoes", quantity: 1.5, unit: "pieces"),
                Ingredient(name: "Onion", quantity: 0.5, unit: "piece"),
                Ingredient(name: "Garlic", quantity: 2, unit: "cloves"),
                Ingredient(name: "Ginger", quantity: 0.5, unit: "tsp"),
                Ingredient(name: "Curry powder", quantity: 4, unit: "tsp"),
                Ingredient(name: "Salt", quantity: 1, unit: "tsp"),
                Ingredient(name: "Black pepper", quantity: 0.5, unit: "tsp"),
                Ingredient(name: "Oil for frying", quantity: 3, unit: "tbsp")
            ],
            preparationTime: "30 minutes",
            region: "Southern Africa",
            imageURL: "https://i.pinimg.com/1200x/15/3e/8b/153e8ba6273a2795fc54f3e718153685.jpg",
            cookingInstructions: [
                "Soak mopani worms in boiling water for 10 minutes, then rinse",
                "Fry garlic and ginger in oil, add mopani worms and fry 10 minutes",
                "Add curry powder, onions, and tomatoes, cook until done",
                "Garnish with shallots and serve with sadza"
            ],
            defaultServings: 2
        ),
        AfricanFood(
            name: "Road-Runner Chicken Stew",
            description: "Traditional free-range chicken stew, slow-cooked and richly seasoned",
            ingredients: [
                Ingredient(name: "Road-runner chicken", quantity: 2, unit: "kg"),
                Ingredient(name: "Water", quantity: 960, unit: "ml"),
                Ingredient(name: "Onion", quantity: 1, unit: "medium"),
                Ingredient(name: "Tomatoes", quantity: 3, unit: "medium"),
                Ingredient(name: "Garlic", quantity: 4, unit: "cloves"),
                Ingredient(name: "Tomato soup powder", quantity: 2, unit: "tbsp"),
                Ingredient(name: "Salt", quantity: 1, unit: "tsp"),
                Ingredient(name: "Tomato sauce", quantity: 2, unit: "tbsp"),
                Ingredient(name: "Paprika", quantity: 1, unit: "tsp")
            ],
            preparationTime: "1 hr 45 min",
            region: "Southern Africa",
            imageURL: "https://www.zimbokitchen.com/wp-content/uploads/2013/11/Zimbabwe-food-recipes-road-runner-chicken.png",
            cookingInstructions: [
                "Boil chicken in 400 ml water with salt for 50 minutes",
                "Add garlic and paprika, fry until browned",
                "Add water and simmer until tender",
                "Add onions, tomatoes, and soup powder. Simmer until thickened"
            ],
            defaultServings: 2
        ),
        
        AfricanFood(
            name: "Bobotie",
            description: "South African baked dish consisting of spiced minced meat with an egg-based topping",
            ingredients: [
                Ingredient(name: "Minced beef", quantity: 500, unit: "g"),
                Ingredient(name: "Bread", quantity: 2, unit: "slices"),
                Ingredient(name: "Milk", quantity: 1, unit: "cup"),
                Ingredient(name: "Onion", quantity: 1, unit: "large"),
                Ingredient(name: "Spices", quantity: 1, unit: "tbsp"),
                Ingredient(name: "Eggs", quantity: 2, unit: "pieces"),
                Ingredient(name: "Raisins", quantity: 1, unit: "handful")
            ],
            preparationTime: "1 hour",
            region: "Southern Africa",
            imageURL: "https://www.panningtheglobe.com/wp-content/uploads/2013/02/bobotie-square.jpg",
            cookingInstructions: [
                "Soak bread in milk",
                "Fry onions and mince",
                "Mix meat with soaked bread, spices, and raisins",
                "Bake with egg topping for 30 minutes"
            ],
            defaultServings: 2
        ),
        AfricanFood(
            name: "Chicken Gizzards Stew",
            description: "Tender chicken gizzards simmered with Worcester sauce and vegetables.",
            ingredients: [
                Ingredient(name: "Chicken gizzards", quantity: 500, unit: "g"),
                Ingredient(name: "Onion", quantity: 0.5, unit: "piece"),
                Ingredient(name: "Garlic cloves", quantity: 3, unit: "pieces"),
                Ingredient(name: "Carrots", quantity: 3, unit: "pieces"),
                Ingredient(name: "Green pepper", quantity: 1, unit: "piece"),
                Ingredient(name: "Tomato paste", quantity: 1.5, unit: "tbsp"),
                Ingredient(name: "Worcester sauce", quantity: 40, unit: "ml"),
                Ingredient(name: "Oil", quantity: 2, unit: "tbsp"),
                Ingredient(name: "Water", quantity: 150, unit: "ml"),
                Ingredient(name: "Salt", quantity: 1, unit: "tsp")
            ],
            preparationTime: "45 minutes",
            region: "Southern Africa",
            imageURL: "https://lowcarbafrica.com/wp-content/uploads/2020/01/Peppered-Gizzard-IG-5.jpg",
            cookingInstructions: [
                "Fry gizzards until browned, add tomato paste and cook 3 mins.",
                "Add Worcester sauce and simmer 3 mins.",
                "Add onion, garlic, and water. Simmer until tender.",
                "Add carrots, then green pepper. Cook until veggies are soft.",
                "Adjust seasoning and serve hot."
            ],
            defaultServings: 2
        ),
        
        AfricanFood(
            name: "Cow Heels",
            description: "Slow-cooked cow heels in a rich tomato-onion sauce — a Zimbabwean favorite.",
            ingredients: [
                Ingredient(name: "Cow heels", quantity: 1.2, unit: "kg"),
                Ingredient(name: "Salt", quantity: 1.5, unit: "tsp"),
                Ingredient(name: "Water", quantity: 1, unit: "as needed"),
                Ingredient(name: "Onion", quantity: 1, unit: "piece"),
                Ingredient(name: "Tomatoes", quantity: 2, unit: "pieces"),
                Ingredient(name: "Tomato paste", quantity: 1, unit: "tsp"),
                Ingredient(name: "Curry powder", quantity: 0.25, unit: "tsp")
            ],
            preparationTime: "3½ hours",
            region: "Southern Africa",
            imageURL: "https://www.zimbokitchen.com/wp-content/uploads/2018/02/zimbokitchen-zondo.jpg",
            cookingInstructions: [
                "Boil cow heels with salt for 3 hours until tender.",
                "Drain excess fat, leaving a little in the pot.",
                "Add onion, tomatoes, tomato paste, and curry powder.",
                "Simmer until thickened. Use flour paste if needed.",
                "Adjust seasoning and serve with sadza."
            ],
            defaultServings: 4
        ),
        
        AfricanFood(
            name: "Dried Kapenta Stew",
            description: "A quick and flavorful dried fish stew served with sadza.",
            ingredients: [
                Ingredient(name: "Dried kapenta", quantity: 250, unit: "g"),
                Ingredient(name: "Onion", quantity: 1, unit: "piece"),
                Ingredient(name: "Tomatoes", quantity: 2, unit: "pieces"),
                Ingredient(name: "Curry powder", quantity: 0.5, unit: "tsp"),
                Ingredient(name: "Garlic", quantity: 1, unit: "tsp"),
                Ingredient(name: "Tomato paste", quantity: 2, unit: "tsp"),
                Ingredient(name: "Water", quantity: 1, unit: "as needed"),
                Ingredient(name: "Spring onion greens", quantity: 2, unit: "tbsp"),
                Ingredient(name: "Oil", quantity: 2, unit: "tbsp")
            ],
            preparationTime: "20 minutes",
            region: "Southern Africa",
            imageURL: "https://126544886.cdn6.editmysite.com/uploads/1/2/6/5/126544886/3F4SZN4YTTR54JOM2Y6CSQXM.jpeg",
            cookingInstructions: [
                "Soak kapenta in boiling water for 10 mins, drain, and dry.",
                "Fry kapenta until browned, remove and set aside.",
                "In same pan, fry onions and curry powder for 2 mins.",
                "Add tomatoes, garlic, tomato paste, and cook 5 mins.",
                "Add a little water, return kapenta to pot, simmer 3 mins.",
                "Sprinkle spring onion and serve."
            ],
            defaultServings: 2
        ),
        
        AfricanFood(
            name: "Mealie-Meal Porridge",
            description: "Classic Zimbabwean breakfast porridge made from finely ground maize meal.",
            ingredients: [
                Ingredient(name: "Mealie-meal", quantity: 1.5, unit: "cups"),
                Ingredient(name: "Warm water", quantity: 60, unit: "ml"),
                Ingredient(name: "Boiling water", quantity: 2, unit: "cups"),
                Ingredient(name: "Salt", quantity: 1, unit: "tsp")
            ],
            preparationTime: "20 minutes",
            region: "Southern Africa",
            imageURL: "https://i.pinimg.com/736x/11/21/a4/1121a44c9789b4774e7b49511d134e10.jpg",
            cookingInstructions: [
                "Mix mealie-meal with warm water to make a paste.",
                "Add boiling water while stirring. Bring to a boil.",
                "Simmer covered for 15 minutes.",
                "Add salt and stir. Serve with peanut butter, margarine, lemon juice, or sugar."
            ],
            defaultServings: 2
        ),
        
        AfricanFood(
            name: "Okra Stew",
            description: "Quick-cooked okra with tomato and onion in a light, peppery sauce.",
            ingredients: [
                Ingredient(name: "Okra", quantity: 500, unit: "g"),
                Ingredient(name: "Onion", quantity: 1, unit: "small"),
                Ingredient(name: "Tomato", quantity: 1, unit: "piece"),
                Ingredient(name: "Bicarbonate of soda", quantity: 1, unit: "tsp"),
                Ingredient(name: "Black pepper", quantity: 0.25, unit: "tsp"),
                Ingredient(name: "Boiling water", quantity: 300, unit: "ml")
            ],
            preparationTime: "10 minutes",
            region: "Southern Africa",
            imageURL: "https://howtofeedaloon.com/wp-content/uploads/2015/07/okra-7.jpg",
            cookingInstructions: [
                "Bring water and bicarbonate of soda to boil.",
                "Add okra and onion, stir briskly for 3 minutes.",
                "Add tomato, cook and stir for 3 more minutes.",
                "Add black pepper and simmer for 2 minutes.",
                "Serve hot with sadza or rice."
            ],
            defaultServings: 2
        ),
        
        
        AfricanFood(
            name: "Goat Meat Stew",
            description: "Rich and flavorful African-style goat meat stew cooked with tomatoes, spices, and BBQ sauce",
            ingredients: [
                Ingredient(name: "Goat meat", quantity: 1, unit: "kg"),
                Ingredient(name: "Curry powder", quantity: 1, unit: "tsp"),
                Ingredient(name: "Oil", quantity: 3, unit: "tbsp"),
                Ingredient(name: "Salt", quantity: 1, unit: "tsp"),
                Ingredient(name: "Garlic (grated)", quantity: 1, unit: "tbsp"),
                Ingredient(name: "Lemon juice", quantity: 50, unit: "ml"),
                Ingredient(name: "Onion (chopped)", quantity: 1, unit: "medium"),
                Ingredient(name: "Tomatoes (grated)", quantity: 3, unit: "medium"),
                Ingredient(name: "BBQ sauce", quantity: 100, unit: "ml"),
                Ingredient(name: "Chicken stock cube", quantity: 1, unit: "piece"),
                Ingredient(name: "Water", quantity: 400, unit: "ml")
            ],
            preparationTime: "1 hour",
            region: "Southern Africa",
            imageURL: "https://i.pinimg.com/1200x/00/1d/3a/001d3a449481a77571367656e006ccf5.jpg",
            cookingInstructions: [
                "Cut the goat meat into medium pieces and season with salt, curry powder, and garlic",
                "Brown meat in oil, deglaze with lemon juice",
                "Add onions and tomatoes, cook for 5 minutes",
                "Add BBQ sauce, stock cube, and water",
                "Simmer until meat is tender and sauce thickens"
            ],
            defaultServings: 2
        ),
        
        AfricanFood(
            name: "Sugar Bean Stew",
            description: "Savory bean stew with carrots, tomatoes, and spices — a Zimbabwean staple",
            ingredients: [
                Ingredient(name: "Sugar beans", quantity: 3, unit: "cups"),
                Ingredient(name: "Beef stock cube", quantity: 1, unit: "piece"),
                Ingredient(name: "Tomato (chopped)", quantity: 1, unit: "medium"),
                Ingredient(name: "Carrots (chopped)", quantity: 3, unit: "pieces"),
                Ingredient(name: "Green pepper (chopped)", quantity: 0.5, unit: "piece"),
                Ingredient(name: "Garlic (chopped)", quantity: 2, unit: "cloves"),
                Ingredient(name: "Tomato paste", quantity: 2, unit: "tbsp"),
                Ingredient(name: "Curry powder", quantity: 1, unit: "tsp"),
                Ingredient(name: "Salt", quantity: 1, unit: "tsp"),
                Ingredient(name: "Black pepper", quantity: 0.5, unit: "tsp")
            ],
            preparationTime: "1 hour",
            region: "Southern Africa",
            imageURL: "https://i.pinimg.com/1200x/6f/3b/b3/6f3bb3626be158b2e8e37c52418228c8.jpg",
            cookingInstructions: [
                "Boil beans until soft",
                "Add carrots, onions, and garlic, sauté briefly",
                "Add tomatoes, curry, and tomato paste",
                "Simmer and season to taste"
            ],
            defaultServings: 2
        ),
        
        AfricanFood(
            name: "Jollof Rice",
            description: "A popular West African rice dish cooked with tomatoes, peppers, and spices",
            ingredients: [
                Ingredient(name: "Rice", quantity: 2, unit: "cups"),
                Ingredient(name: "Tomato paste", quantity: 3, unit: "tbsp"),
                Ingredient(name: "Bell pepper", quantity: 1, unit: "large"),
                Ingredient(name: "Onion", quantity: 1, unit: "large"),
                Ingredient(name: "Spices", quantity: 1, unit: "tbsp")
            ],
            preparationTime: "45 minutes",
            region: "West Africa",
            imageURL: "https://i.pinimg.com/736x/a7/d4/92/a7d492607aab27346744244d02da29b6.jpg",
            cookingInstructions: [
                "Blend tomatoes, peppers, and onions",
                "Fry the mix with spices",
                "Add rice and water, then simmer until cooked"
            ],
            defaultServings: 2
        )
    ]
    
    
    init() {
        loadFoods()
    }
    
    
    func loadFoods() {
    
        self.foods = self.mockFoods
        self.isLoading = false
    }
    
    func searchFoods(query: String) {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmed.isEmpty {
            self.foods = self.mockFoods
        } else {
            self.foods = self.mockFoods.filter { food in
                food.name.localizedCaseInsensitiveContains(trimmed) ||
                food.description.localizedCaseInsensitiveContains(trimmed) ||
                food.region.localizedCaseInsensitiveContains(trimmed)
            }
        }
        
        self.isLoading = false
    }
    
}
