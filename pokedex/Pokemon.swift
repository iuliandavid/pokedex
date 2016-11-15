//
//  Pokemon.swift
//  pokedex
//
//  Created by iulian david on 11/15/16.
//  Copyright © 2016 iulian david. All rights reserved.
//

import Foundation
/**
 Definition class based on the pokemon.csv
 */
class Pokemon{
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _height:Int!
    private var _weight:Int!
    
    var name: String{
        get{
            return _name
        }
    }
    var pokedexId: Int{
        get{
            return _pokedexId
        }
    }
    
    var height:Int{
        get{
            return _height
        }
    }
    
    var weight:Int{
        get{
            return _weight
        }
    }
    
    init(name:String, id: Int, weight: Int, height: Int) {
        self._name = name
        self._pokedexId = id
        self._height = height
        self._weight = weight
    }
}
