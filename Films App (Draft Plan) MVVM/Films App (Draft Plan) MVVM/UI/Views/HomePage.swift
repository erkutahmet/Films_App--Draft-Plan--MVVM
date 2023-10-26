//
//  ViewController.swift
//  Films App (Draft Plan) MVVM
//
//  Created by Ahmet Erkut on 26.10.2023.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var filmsCollectionView: UICollectionView!
    var filmsList = [Films]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUI() {
        filmsCollectionView.delegate = self
        filmsCollectionView.dataSource = self
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.6)
        
        filmsCollectionView.collectionViewLayout = design
    }
    
    private func setData() {
        let f1 = Films(id: 1, name: "Django", image: "django", price: 24)
        let f2 = Films(id: 2, name: "Interstellar", image: "interstellar", price: 32)
        let f3 = Films(id: 3, name: "Inception", image: "inception", price: 16)
        let f4 = Films(id: 4, name: "The Hateful Eight", image: "thehatefuleight", price: 28)
        let f5 = Films(id: 5, name: "The Pianist", image: "thepianist", price: 18)
        let f6 = Films(id: 6, name: "Anadoluda", image: "anadoluda", price: 10)
        filmsList.append(f1)
        filmsList.append(f2)
        filmsList.append(f3)
        filmsList.append(f4)
        filmsList.append(f5)
        filmsList.append(f6)
    }
}

extension HomePage: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmsList[indexPath.row]
        
        let cell = filmsCollectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as! FilmCell
        
        cell.filmImageView.image = UIImage(named: film.image!)
        cell.priceLabel.text = "\(film.price!) $"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmsList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let data = sender as? Films {
                let toVC = segue.destination as! DetailPage
                toVC.film = data
            }
        }
    }
}

