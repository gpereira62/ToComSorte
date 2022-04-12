//
//  ViewController.swift
//  ToComSorte
//
//  Created by Gustavo Pereira on 10/04/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var deck: UICollectionView!
    
    var cards: [Card] = []
    var selectedCard: Card = Card()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deck.dataSource = self
        deck.delegate = self
        
        let suits: [CardSuit] = [.clubs, .hearts, .spades, .diamonds]
        
        for suit in suits {
            for value in 1...13 {
                let card = Card(value: value, suit: suit)
                cards.append(card)
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCell = deck.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.draw(card: cards[indexPath.item])
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCard = cards[indexPath.item]
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: DetailViewController = segue.destination as! DetailViewController
        vc.userCard = selectedCard
    }
}
