//
//  PokeCell.swift
//  pokedex
//
//  Created by iulian david on 11/15/16.
//  Copyright © 2016 iulian david. All rights reserved.
//

import UIKit

/**
 The cell containing data for the pokemon
 */
class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    private var pokemon: Pokemon!
    
    func configure(pokemon: Pokemon)  {
        
        self.pokemon = pokemon
        
        mainLbl.text = self.pokemon.name.capitalized
        
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
