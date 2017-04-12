//
//  ShowDataStore.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation

final class ShowDataStore {
    static let shared = ShowDataStore()
    fileprivate init() {}
    
    
    var shows = [Show]()
    
    func getShows(completion: @escaping () -> ()) {
        self.shows.removeAll()
        TVMazeApiClient.getShows { (json) in
            let showArray = json.arrayValue
            for showDict in showArray {
                let show = Show(showDict)
                self.shows.append(show)
            }
            
            completion()
        }
    }
    
    
    func getEpisodes(forShow showId:Int, completion: @escaping([Episode]) -> ()) {
        var episodes = [Episode]()
        
        TVMazeApiClient.getEpisodes(forShow: showId) { (json) in
            
            let episodeArray = json.arrayValue
            for episodeDict in episodeArray {
                let episode = Episode(episodeDict)
                episodes.append(episode)
            }
            completion(episodes)
        }
    }
    
}
