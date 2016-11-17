//
//  Constants.swift
//  pokedex
//
//  Created by iulian david on 11/16/16.
//  Copyright © 2016 iulian david. All rights reserved.
//

/*
 Global variabiles definitions
 */
import Foundation

let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v1/pokemon/"

/**
 Closure called when download ends
 This will be passed to dowload pokemon function in Pokemon class
 */
typealias DownloadComplete = () -> ()
