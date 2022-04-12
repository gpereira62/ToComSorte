//
//  CardCell.swift
//  ToComSorte
//
//  Created by Gustavo Pereira on 11/04/22.
//

import Foundation
import UIKit

class CardCell: UICollectionViewCell {
    
    @IBOutlet weak var topValueLabel: UILabel!
    @IBOutlet weak var topSuitLabel: UILabel!
    @IBOutlet weak var figure: UILabel!
    @IBOutlet weak var bottomSuitLabel: UILabel!
    @IBOutlet weak var bottomValueLabel: UILabel!
    
    func draw(card: Card) {
        let color: UIColor = (card.suit == .clubs || card.suit == .spades) ? .label : .systemRed
        topValueLabel.text = card.getLabel()
        topValueLabel.textColor = color
        
        topSuitLabel.text = card.getSymbol()
        topSuitLabel.textColor = color
        
        figure.text = card.getSymbol()
        figure.textColor = color
        
        bottomValueLabel.text = card.getLabel()
        bottomValueLabel.textColor = color
        bottomValueLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        bottomSuitLabel.text = card.getSymbol()
        bottomSuitLabel.textColor = color
        bottomSuitLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
}
