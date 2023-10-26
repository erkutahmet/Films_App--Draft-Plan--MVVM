//
//  DetailPage.swift
//  Films App (Draft Plan) MVVM
//
//  Created by Ahmet Erkut on 26.10.2023.
//

import UIKit

class DetailPage: UIViewController {

    @IBOutlet weak var filmLabel: UILabel!
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!

    var film:Films?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        if let f = film {
            filmLabel.text = f.name
            filmImageView.image = UIImage(named: f.image!)
            priceLabel.text = "\(f.price!) $"
        }
    }

}
