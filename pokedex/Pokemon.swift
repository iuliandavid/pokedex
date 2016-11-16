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
    private var _description: String!
    private var _type: String!
    private var _defense:Int!
    private var _attack: Int!
    private var _nextEvolutionTxt: String!
    
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
    
    var description:String{
        get{
            return _description
        }
    }
    
    var attack:Int{
        get{
            return _attack
        }
    }
    
    var defense:Int{
        get{
            return _defense
        }
    }
    
    var type:String{
        get{
            return _type
        }
    }
    
    var nextEvolutionTxt:String{
        get{
            return _nextEvolutionTxt
        }
    }
    
    init(name:String, id: Int, weight: Int, height: Int) {
        self._name = name
        self._pokedexId = id
        self._height = height
        self._weight = weight
    }
}
