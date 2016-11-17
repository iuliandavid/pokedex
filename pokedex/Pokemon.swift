//
//  Pokemon.swift
//  pokedex
//
//  Created by iulian david on 11/15/16.
//  Copyright © 2016 iulian david. All rights reserved.
//

import Foundation
import Alamofire
/**
 Definition class based on the pokemon.csv
 */
class Pokemon{
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _height:String!
    private var _weight:String!
    private var _description: String!
    private var _type: String!
    private var _defense:Int!
    private var _attack: Int!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionLvl: String!
    private var _nextEvolutionId: String!
    
    private var _pokemonURL: String!
    
    var name: String{
        return _name
    }
    var pokedexId: Int{
        return _pokedexId
    }
    
    var height:String{
        return _height
    }
    
    var weight:String{
        return _weight
    }
    
    var description:String{
        
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var attack:Int{
        return _attack
    }
    
    var defense:Int{
        return _defense
    }
    
    var type:String{
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var nextEvolutionTxt:String{
        
        if _nextEvolutionTxt == nil {
            _nextEvolutionTxt = ""
        }
        
        return _nextEvolutionTxt
    }
    
    var nextEvolutionName:String{
        
        if _nextEvolutionName == nil {
            _nextEvolutionName = ""
        }
        
        return _nextEvolutionName
    }
    
    var nextEvolutionLvl:String{
        
        if _nextEvolutionLvl == nil {
            _nextEvolutionLvl = ""
        }
        return _nextEvolutionLvl
    }
    
    var nextEvolutionId:String{
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var pokemonURL : String {
        return _pokemonURL
    }
    
    init(name:String, id: Int) {
        self._name = name
        self._pokedexId = id
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    /**
     Asynchronuos download details
    */
    func downloadPokemonDetails(completed: @escaping DownloadComplete)  {
        
        Alamofire.request(_pokemonURL, encoding: JSONEncoding(options: [])).responseJSON(completionHandler: {(response) in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String  {
                    self._weight = weight
                }
                if let height = dict["height"] as? String  {
                    self._height = height
                }
                if let defense = dict["defense"] as? Int  {
                    self._defense = defense
                }
                if let attack = dict["attack"] as? Int  {
                    self._attack = attack
                }
                //cast as dictionary and put a condition to item count
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
//                    self.simpleSolution(dict: types, filter: "name")
                    
                    self._type = self.functionalSolution(dict: types, filter: "name")
                    
                }
                if let descLink = dict["descriptions"] as? [Dictionary<String, String>], descLink.count>0 {
                    if let url = descLink[0]["resource_uri"]  {
//                        let desc = self.getDescription(link: url)
                        let url = "\(URL_BASE)\(url)"
                        var result: String = ""
                        Alamofire.request(url).responseJSON(completionHandler: {
                            (response) in
                            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                                if let res = dict["description"] as? String {
                                    result = res
                                }
                            }
                            self._description = result
                            print(result)
                            completed()
                        })
                        
                    }
                } else {
                    self._description = ""
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count>0 {
                    if let nextEvo = evolutions[0]["to"] as? String {
                        //String indexOf text!!!!
                        if nextEvo.range(of: "mega") == nil {
                            self._nextEvolutionName = nextEvo
                            if let uri = evolutions[0]["resource_uri"] {
                                let newString = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoID = newString.replacingOccurrences(of: "/", with: "")
                                
                                self._nextEvolutionId = nextEvoID
                                
                                if let lvlExists = evolutions[0]["level"] {
                                    self._nextEvolutionLvl = "\(lvlExists)"
                                } else {
                                    self._nextEvolutionLvl = ""
                                }
                            }
                        }
                    }
                }
            }
            //added the closure
            completed()
        })
    }
    
    //Returns the values from an array of Dictionary 
    //
    private func simpleSolution(dict: [Dictionary<String, String>], filter: String) -> String {
        var result: String = ""
        if let name = dict[0][filter] {
            result = name.capitalized
        }
        
        if dict.count > 1 {
            for x in 1..<dict.count {
                result += "/\(dict[x][filter]?.capitalized)"
            }
        }
        
        return type
    }
    
    /**
     Converts A Dictionary to a String using join and filters
      1. [Dictionary<String, String>] -> flattened to an Array
      2. [(key: String,value: String)] filtered with condition on  key == "name"
      3. join the value from [(key: String, value: String)] with "," as separator
     
     - Parameter dict: The Dictionary to reduce
     - Parameter filter: The filter to be applied on elements
     
    */
    private func functionalSolution(dict: [Dictionary<String, String>], filter: String ) -> String {
       
        let nameTypesTuples = dict.flatMap { $0 }.filter({$0.0 == filter})
        
        return nameTypesTuples.map({$0.1.capitalized}).joined(separator: "/")

    }
    
    func getDescription(link: String) -> String {
        let url = "\(URL_BASE)\(link)"
        var result: String = ""
        Alamofire.request(url).responseJSON(completionHandler: {
            (response) in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let res = dict["description"] as? String {
                    result = res
                }
            }
            self._description = result
            print(result)
        })
        
        return result
    }
}
