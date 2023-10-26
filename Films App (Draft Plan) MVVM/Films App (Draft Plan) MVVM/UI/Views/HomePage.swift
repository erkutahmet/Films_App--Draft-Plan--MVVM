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
    
    var homePageVM = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        _ = homePageVM.filmsList.subscribe(onNext: { list in
            self.filmsList = list
            self.filmsCollectionView.reloadData()
        })
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
}

extension HomePage: UICollectionViewDelegate, UICollectionViewDataSource, CellProtocol{
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
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        
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
    
    func addToBasketClicked(indexPath: IndexPath) {
        let film = filmsList[indexPath.row]
        print("\(film.name!) added to basket!")
    }
    
}

