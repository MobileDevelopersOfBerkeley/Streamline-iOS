//
//  NowPlayingView.swift
//  Streamline
//
//  Created by Stephen Jayakar on 10/28/17.
//  Copyright © 2017 Stephen Jayakar. All rights reserved.
//


class NowPlayingView: UIView {
    var backButton: UIButton!
    var albumImage: UIImageView!
    var songName: UILabel!
    var artistName: UILabel!
    var slider: UISlider!
    var playButton: UIButton!
    var forwardButton: UIButton!
    var backwardButton: UIButton!
    var delegate: NowPlayingViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backButton = UIButton(frame: Utils.rRect(rx: 26, ry: 25.5, rw: 25, rh: 25))
        backButton.setImage(UIImage(named: "Vector"), for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        addSubview(backButton)
        
        //albumImage = UIImageView(frame: Utils.rRect(rx: 66, ry: 136, rw: 245, rh: 245))
        albumImage = UIImageView(frame: CGRect(x: 0, y: frame.width * 0.17, width: self.frame.width, height: self.frame.width))
        albumImage.image = UIImage(named: "albumPlaceholder")
        albumImage.contentMode = .scaleAspectFit
        addSubview(albumImage)
        
        songName = UILabel(frame: CGRect(x: 0, y: frame.height * 0.69, width: frame.width, height: 35))
        songName.text = "Song"
        songName.adjustsFontSizeToFitWidth = true
        songName.textColor = .black
        songName.font = Constants.averageSans
        songName.font = UIFont.systemFont(ofSize: 20, weight: 1)
        songName.textAlignment = .center
        addSubview(songName)
        
        artistName = UILabel(frame: CGRect(x: 0, y: frame.height * 0.74, width: frame.width, height: 25))
        artistName.text = "Artist"
        artistName.adjustsFontSizeToFitWidth = true
        artistName.textColor = .black
        artistName.font = Constants.averageSans?.withSize(15)
        artistName.textAlignment = .center
        addSubview(artistName)
        
        slider = UISlider(frame: Utils.rRect(rx: 26, ry: 540, rw: 328, rh: 20))
        slider.isContinuous = false
        slider.maximumValue = 1
        slider.minimumValue = 0
        slider.addTarget(self, action: #selector(sliderChanging), for: .touchDown)
        slider.addTarget(self, action: #selector(sliderNoLongerChanging), for: .touchUpInside)
        slider.addTarget(self, action: #selector(sliderNoLongerChanging), for: .touchUpOutside)
        slider.setThumbImage(UIImage(named: "thumb"), for: .normal)
        slider.minimumTrackTintColor = UIColor.black
        slider.maximumTrackTintColor = UIColor(hex: "d1c4e9")
        // TODO: Have to change the maximum and minimum image to match the figma
        addSubview(slider)
        
        playButton = UIButton(frame: Utils.rRect(rx: 175, ry: 598, rw: 25, rh: 25))
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        if State.paused {
            playButton.setBackgroundImage(UIImage(named: "play"), for: .normal)
        } else {
            playButton.setBackgroundImage(UIImage(named: "pause"), for: .normal)
        }
        addSubview(playButton)
        
        forwardButton = UIButton(frame: Utils.rRect(rx: 250.5, ry: 600.5, rw: 20, rh: 20))
        forwardButton.addTarget(self, action: #selector(forwardButtonPressed), for: .touchUpInside)
        forwardButton.setBackgroundImage(#imageLiteral(resourceName: "forward"), for: .normal)
        addSubview(forwardButton)
        
        backwardButton = UIButton(frame: Utils.rRect(rx: 104.5, ry: 600.5, rw: 20, rh: 20))
        backwardButton.addTarget(self, action: #selector(backwardButtonPressed), for: .touchUpInside)
        backwardButton.setBackgroundImage(#imageLiteral(resourceName: "rewind"), for: .normal)
        addSubview(backwardButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Selectors
    func playButtonPressed() {
        self.delegate?.playButtonPressed()
    }
    
    func backButtonPressed() {
        self.delegate?.backButtonPressed()
    }
    
    func forwardButtonPressed() {
        self.delegate?.forwardButtonPressed()
    }
    
    func backwardButtonPressed() {
        self.delegate?.backwardButtonPressed()
    }
    
    func sliderChanging() {
        self.delegate?.sliderChanging()
    }
    
    func sliderNoLongerChanging() {
        self.delegate?.sliderNoLongerChanging()
    }
}

protocol NowPlayingViewDelegate {
    func playButtonPressed()
    func backButtonPressed()
    func forwardButtonPressed()
    func backwardButtonPressed()
    func sliderChanging()
    func sliderNoLongerChanging()
}
