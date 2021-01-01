//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by ramesh on 31/12/20.
//

import Foundation


struct AddCoffeOrderViewModel {
    
    var name: String?
    var email: String?

    var selectedSize: String?
    
    var selectedType: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map{ $0.rawValue.capitalized }
    }
    
}
