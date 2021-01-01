//
//  Order.swift
//  HotCoffee
//
//  Created by ramesh on 30/12/20.
//

import Foundation

enum CoffeeType: String , Codable , CaseIterable {
    case cappuccino
    case latte
    case Latte
    case espressino
    case cortado
    
}

enum CoffeeSize : String , Codable , CaseIterable {
    case small
    case medium
    case large
}
struct Order : Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}

extension Order {
    
    
    static func create(vm: AddCoffeOrderViewModel) -> Resource<Order?> {
       
        let order = Order(vm)
        
        guard let url = URL(string: "http://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        return resource
        
    }
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "http://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect")
        }
        
        return Resource<[Order]>(url: url)
    }()
}
extension Order {
    
    init?(_ vm: AddCoffeOrderViewModel) {
        guard let name = vm.name,
        let email = vm.email,
        let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
        let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
