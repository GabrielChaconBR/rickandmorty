//
//  RickAndMortyModelFactory.swift
//  DataTests
//
//  Created by Gabriel Chacon on 11/08/23.
//

import Foundation
import Domain

func makeRickAndMortyModel() -> RickAndMortyModel {
    RickAndMortyModel(characters: "http://characters-url.com")
}
