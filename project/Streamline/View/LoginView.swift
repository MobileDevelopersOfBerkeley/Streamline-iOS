//
//  LoginView.swift
//  Streamline
//
//  Created by Annie Tang on 10/21/17.
//  Copyright © 2017 Stephen Jayakar. All rights reserved.
//

import UIKit

class LoginView: UIView {
    var logoImage: UIImageView!
    var logoText: UILabel!
    var connectButton: UIButton!
    var connectLabel: UILabel!
    var delegate: LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        setupLandingImage()
        setupButton()
    }
    
    func setupLandingImage() {
        let landingImageView = UIImageView(frame: bounds)
        landingImageView.image = #imageLiteral(resourceName: "LandingImage")
        addSubview(landingImageView)
    }
    
    func setupButton() {
        connectButton = UIButton(frame:
            Utils.rRect(rx: 56, ry: 522, rw: 263, rh: 53))
        connectButton.addTarget(self, action: #selector(connectButtonPressed), for: .touchUpInside)
        connectButton.layer.cornerRadius    = 15
        connectButton.backgroundColor       = UIColor.white
        connectButton.layer.shadowRadius    = 3
        connectButton.layer.shadowOffset    = CGSize(width: 0, height: 4)
        connectButton.layer.shadowColor     = UIColor.black.cgColor
        connectButton.layer.shadowOpacity   = 0.35
        addSubview(connectButton)
        
        let connectLabel                    = UILabel(frame:
            Utils.rRect(rx: 113, ry: 537, rw: 185, rh: 20))
        connectLabel.textColor              = Constants.darkPurple
        connectLabel.text                   = "CONNECT WITH SPOTIFY"
        connectLabel.textAlignment          = .center
        connectLabel.font                   = Constants.averageSans
        connectLabel.font                   = UIFont.systemFont(ofSize: 14, weight: 1)
        connectLabel.minimumScaleFactor     = 10 / UIFont.labelFontSize
        connectLabel.adjustsFontSizeToFitWidth = true
        addSubview(connectLabel)
        
        let spotifyLogo = UIImageView(frame:
            Utils.rRect(rx: 80, ry: 536, rw: 26, rh: 26))
        spotifyLogo.image = #imageLiteral(resourceName: "spotify-logo")
        addSubview(spotifyLogo)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Selectors
    @objc
    func connectButtonPressed() {
        self.delegate?.connectButtonPressed()
    }
}

protocol LoginViewDelegate {
    func connectButtonPressed()
}
