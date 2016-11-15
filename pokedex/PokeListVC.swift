//
//  ViewController.swift
//  pokedex
//
//  Created by iulian david on 11/14/16.
//  Copyright © 2016 iulian david. All rights reserved.
//

import UIKit

/**
 An exercise from a tutorial
 Uses the images from the https://github.com/PokeAPI/pokeapi repo instead of downloading them
 
 */
class PokeListVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    ///Outlets definitions
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var search: UISearchBar!
    
    
    var pokemons = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up the targets
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIndentifier, for: indexPath) as? PokeCell {
            let pokemon = DataService.sharedInstance.pokemons[indexPath.row]
            cell.configure(pokemon: pokemon)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.sharedInstance.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }

}

