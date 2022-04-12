//
//  DetailViewController.swift
//  ToComSorte
//
//  Created by Gustavo Pereira on 11/04/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var deck: UICollectionView!
    
    var cards: [Card] = []
    var userCard: Card = Card()
    
    override func viewDidLoad() {
        let myCard: Card = Card()
        
        cards.append(userCard)
        cards.append(myCard)
        
        deck.dataSource = self
        
        titleLabel.text = (userCard == myCard) ? "Vish Maria" : "Ta lascado"
        textLabel.text = (userCard == myCard) ? "Mano, Ta com sorte mesmo hein?" : "Mas ta azarado de mais ein!!!"
    }
}

extension DetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCell = deck.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.draw(card: cards[indexPath.item])
        
        return cell
    }
    
    
}
