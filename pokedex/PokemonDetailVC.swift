//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by iulian david on 11/15/16.
//  Copyright © 2016 iulian david. All rights reserved.
//
import UIKit
import Foundation

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var pokemonIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        pokemonIdLbl.text = "\(pokemon.pokedexId)"
        titleLbl.text = pokemon.name
        
        pokemon.downloadPokemonDetails { 
            //Whatever we write here will only be called after the network call is complete!
            self.updateUI()
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI(){
        self.weightLbl.text = self.pokemon.weight
        self.height.text = self.pokemon.height
        self.defenseLbl.text = "\(self.pokemon.defense)"
        self.baseAttackLbl.text = "\(self.pokemon.attack)"
        self.typeLbl.text = self.pokemon.type
    }
    
}
