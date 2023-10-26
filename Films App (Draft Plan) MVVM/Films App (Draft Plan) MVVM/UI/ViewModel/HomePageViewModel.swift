//
//  HomePageViewModel.swift
//  Films App (Draft Plan) MVVM
//
//  Created by Ahmet Erkut on 26.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    
    var filmsList = BehaviorSubject<[Films]>(value: [Films]())
    let fRepo = FilmsDaoRepository()
    
    init() {
        self.filmsList = fRepo.filmsList
        filmsReload()
    }
    
    func filmsReload() {
        fRepo.filmsReload()
    }
}
