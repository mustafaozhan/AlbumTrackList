//
//  HomeViewModel.swift
//  AlbumTrackList
//
//  Created by Mustafa Ozhan on 22/06/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel{
    
    public enum HomeError{
        case internetError(String)
        case serverMessage(String)
    }
    
    public let albums: PublishSubject<[Album]> = PublishSubject()
    public let tracks: PublishSubject<[Track]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error: PublishSubject<HomeError> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    public func requestData(){
        
        self.loading.onNext(true)
        
        APIManager.requestData(url: "dd6603a9308cef649405a54d18696061/raw/b6edb3afde1aeaab1860367b2a544b9604ba12cc/TrackAlbumList.json", method: .get, parameters: nil, completion: { (result) in self.loading.onNext(false)
            
            switch result{
            case .success(let returnJson) :
                let albums = returnJson["Albums"].arrayValue.compactMap{return Album(data: try! $0.rawData())}
                let tracks = returnJson["Tracks"].arrayValue.compactMap{return Track(data: try! $0.rawData())}
                
                self.albums.onNext(albums)
                self.tracks.onNext(tracks)
                
            case .failure(let failure):
                switch failure {
                case .connectionError:
                    self.error.onNext(.internetError("Check your internet connection"))
                case .authorizationError(let errorJson):
                    self.error.onNext(.serverMessage(errorJson["message"].stringValue))
                default:
                    self.error.onNext(.serverMessage("Unknown Error"))
                }
            }
        })
    }
    
}
