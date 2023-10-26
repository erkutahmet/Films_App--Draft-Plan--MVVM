//
//  FilmCell.swift
//  Films App (Draft Plan) MVVM
//
//  Created by Ahmet Erkut on 26.10.2023.
//

import UIKit

protocol CellProtocol {
    func addToBasketClicked(indexPath: IndexPath)
}

class FilmCell: UICollectionViewCell {
    
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    @IBAction func addToBasketButton(_ sender: Any) {
        cellProtocol?.addToBasketClicked(indexPath: self.indexPath!)
    }
}
