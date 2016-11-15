//
//  ViewController.swift
//  pokedex
//
//  Created by iulian david on 11/14/16.
//  Copyright © 2016 iulian david. All rights reserved.
//

import UIKit
import AVFoundation //needed for sound effects
/**
 An exercise from a tutorial
 Uses the images from the https://github.com/PokeAPI/pokeapi repo instead of downloading them
 
 */
class PokeListVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    
    ///Outlets definitions
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var filtered = [Pokemon]()
    var inSearchMode = false
    
    ///set up the audio player
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up the targets
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
       initAudio()
        
    }

    func initAudio(){
        do{
            //load resource from bunle
            let resource = Bundle.main.path(forResource: "music", ofType: "mp3")!
            //cast it as URL
            let url:URL = NSURL(fileURLWithPath: resource) as URL
            //initialize AVAudioPlayer with the contents of URL
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            
            musicPlayer.prepareToPlay()
            
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIndentifier, for: indexPath) as? PokeCell {
            var pokemon : Pokemon
            if inSearchMode {
                pokemon = filtered[indexPath.row]
            } else {
                pokemon = DataService.sharedInstance.pokemons[indexPath.row]
            }
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
        if inSearchMode {
            return filtered.count
        } else {
        
        return DataService.sharedInstance.pokemons.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }

    @IBAction func playMusic(_ sender: UIButton) {
        
        if(musicPlayer.isPlaying) {
            musicPlayer.pause()
            sender.alpha = 0.2
        } else  {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
    
    /**
     Override on value changed on search bar
    */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || (searchBar.text?.isEmpty)! {
            inSearchMode = false
            collectionView.reloadData()
            ///hide the keyboard
            view.endEditing(true)
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            let pokemons = DataService.sharedInstance.pokemons
            filtered = pokemons.filter( {$0.name.range(of: lower) != nil })
            collectionView.reloadData()
        }
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        ///hide the keyboard
         view.endEditing(true)
    }
}

