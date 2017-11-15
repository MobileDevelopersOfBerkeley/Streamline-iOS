//
//  State.swift
//  Streamline
//
//  Created by Stephen Jayakar on 10/28/17.
//  Copyright © 2017 Stephen Jayakar. All rights reserved.
//

//Maintains the state of the player
struct State {
    static var nowPlayingIndex: Int?
    static var paused: Bool = false
    static var position: TimeInterval = 0
}
