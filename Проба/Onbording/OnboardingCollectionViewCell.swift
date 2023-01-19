//
//  OnboardingCollectionViewCell.swift
//  Проба
//
//  Created by Карина on 10.01.2023.
//

import UIKit

//MARK: - OnboardingCollectionViewCell

final class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet var slideImageView: UIImageView!
    @IBOutlet var slideTitleView: UILabel!
    @IBOutlet var slideDescriptionLabel: UILabel!
    
    func setup(_ slides: OnboardingSlide) {
        slideImageView.image = slides.image
        slideTitleView.text = slides.title
        slideDescriptionLabel.text = slides.description
    }
}
