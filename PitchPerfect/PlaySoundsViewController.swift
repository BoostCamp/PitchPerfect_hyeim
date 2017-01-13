//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by NEXT on 2017. 1. 11..
//  Copyright © 2017년 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    var degree: Float! = 0.5
    
    @IBAction func controlDegree(_ sender: UISlider) {
        degree = sender.value
    }
    
    enum ButtonType: Int { case slow = 0, fast, chipmunk, vader, echo, reverb }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        if let degree = degree {
            switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 1 - degree)
            case .fast:
                playSound(rate: 1 + degree)
            case .chipmunk:
                playSound(pitch: 1000 * degree)
            case .vader:
                playSound(pitch: -1000 * degree)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
        }
        
        configureUI(.playing)
        }
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

}
