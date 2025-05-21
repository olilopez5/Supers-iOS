//
//  SuperheroResponse.swift
//  Supers-iOS
//
//  Created by Mañanas on 20/5/25.
//

import Foundation

struct SuperheroResponse : Codable {
    let results: [Superhero]
}

struct Superhero : Codable {
    let id: String
    let name: String
    let image: Image
    //let biography: Biography
    //let work: Work
    //let powerstats: Powerstats
    //let appearance: Appearance

}
/*
struct Biography : Codable {
    let fullName: String
    let alterEgos: String
    let placeOfBirth: String
    let publisher: String
    let alignment: String
    
    enum CodingKeys : String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case placeOfBirth = "place-of-birth"
        case publisher ,alignment
    }
}

struct Work : Codable {
    let occupation: String
    let base: String
    
}

struct Powerstats : Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
    
}

struct Appearance: Codable {
    let gender: String
    let race: String
    let height: String
    let weight: String
    let eyeColor: String
    let hairColor: String
   
    enum CodingKeys : String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
        
    }
    
}
 */

struct Image : Codable {
    let url: String
  }
