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
        
        titleLbl.text = pokemon.name
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
