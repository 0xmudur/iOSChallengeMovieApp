//
//  PopularMovieResult.swift
//  iOSChallengeMovieApp
//
//  Created by Muhammed Emin Aydın on 2.06.2021.
//

import Foundation

struct PopularMovieResult: Decodable {
    let page: Int
    let lastPage: Int
    let results: [MovieResult]
    
    enum CodingKeys: String, CodingKey {
        case page
        case lastPage = "total_pages"
        case results
    }
}

struct MovieResult: Decodable {
    let name: String
    let id: Int
    let description: String
    let voteCount: Int
    let voteAverage: Double
    let poster: String?
    let backdrop: String?
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case id = "id"
        case description = "overview"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case poster = "poster_path"
        case backdrop = "backdrop_path"
        case date = "release_date"
    }
}
