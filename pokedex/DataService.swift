//
//  DataService.swift
//  pokedex
//
//  Created by iulian david on 11/15/16.
//  Copyright © 2016 iulian david. All rights reserved.
//

import Foundation

/**
 Singleton for getting the data from csv file
 */
class DataService {
    
    static let sharedInstance = DataService()
    
    private var _pokemons = [Pokemon]()
    
    private init(){
        parsePokemonCSV();
    }
    
    
    private func parsePokemonCSV(){
        if let path = Bundle.main.path(forResource: "pokemon", ofType: "csv") {
            do {
                let csv = try CSVParser.init(contentsOfURL: path)
                let rows = csv.rows
                for row in rows {
                    if let pokeId = Int(row["id"]!),let weight = Int(row["weight"]!),
                        let height = Int(row["height"]!), let name = row["identifier"] {
                        let pokemon = Pokemon(name: name, id: pokeId, weight: weight, height: height)
                        _pokemons.append(pokemon)
                    }
                }
            } catch let error as NSError {
                print(error.debugDescription)
            }
        }
        
    }
    
    var pokemons : [Pokemon] {
        return _pokemons
    }
}
