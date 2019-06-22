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
    public let tracks: PublishSubject<[Album]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error: PublishSubject<HomeError> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    public func requestData(){
        
        self.loading.onNext(true)
        
        
    }
    
}
