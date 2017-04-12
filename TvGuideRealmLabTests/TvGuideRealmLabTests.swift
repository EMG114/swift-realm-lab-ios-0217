//
//  TvGuideRealmLabTests.swift
//  TvGuideRealmLabTests
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import XCTest
import Realm
import RealmSwift
@testable import TvGuideRealmLab


class TvGuideRealmLabTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
        super.tearDown()
    }
    
    func testCreateSavedEpisode() {
        let episodes: Results<SavedEpisode>!
        let episode = SavedEpisode(name: "The Force Awakens", info: "S1 E1", imageUrl: "force.png")
        
        let basicEpisode = Episode()
        let savedEpisode = SavedEpisode(basicEpisode)
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(savedEpisode)
            realm.add(episode)
        }
        
        
        episodes = realm.objects(SavedEpisode.self)
        XCTAssertTrue(episodes.count == 2, "Did not find two episodes")
        
    }
    
    func testCreateSavedShow() {
        let shows: Results<SavedShow>!
        let show = SavedShow(name: "Star Wars", summary: "In a galaxy far away", imageUrl: "yoda.png", id: 1, rating: 10.0)
        
        let basicShow = Show()
        let savedshow = SavedShow(basicShow)
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(show)
            realm.add(savedshow)
        }
        
        shows = realm.objects(SavedShow.self)
        XCTAssertTrue(shows.count == 2, "Found two shows")
        
        
        
        
    }
    
    
    func testFavoriteShow() {
        
        let shows: Results<SavedShow>!
        let show = Show()
        RealmManager.favoriteShow(show)
        
        let realm = try! Realm()
        shows = realm.objects(SavedShow.self)
        
        XCTAssertEqual(shows.count, 1, "\(shows.count) not equal to 1")
    }
    
    
    func testFavoriteEpisodeToShow() {
        
        let shows: Results<SavedShow>!
        let episodes: Results<SavedEpisode>!
        
        let show = Show()
        let episode = Episode()
        RealmManager.favoriteShow(show)
        
        let realm = try! Realm()
        shows = realm.objects(SavedShow.self)
        episodes = realm.objects(SavedEpisode.self)
        
        RealmManager.favoriteEpisode(episode, to: show)
        
        XCTAssertEqual(shows.count, 1, "\(shows.count) not equal to 1")
        XCTAssertEqual(episodes.count, 1, "\(episodes.count) not equal to 1")
        
        
        if let foundShow = shows.first {
            XCTAssertEqual(foundShow.episodes.count, 1, "\(foundShow.episodes.count) not equal to 1")
        }
  
    }

    
}
