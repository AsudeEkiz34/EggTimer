//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTime=["Soft":300, "Medium":420,"Hard":720]
    var timer = Timer()
    var totalTime:Float=0
    var secondsPassed:Float=0
    var player: AVAudioPlayer?
    
    
    
    @IBAction func hardnessSelected(_ sender:
                                        UIButton) {
       
        timer.invalidate()
        let hardness=sender.currentTitle!
        totalTime = Float(eggTime[hardness]!)
        progressView.progress=0.0
        secondsPassed=0
        titleLabel.text=hardness
       
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true )
    
     
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func updateCounter() {
        //example functionality
        if  secondsPassed <= totalTime {
            
            
            progressView.progress=secondsPassed/totalTime
            secondsPassed += 1
        }
        else{
            timer.invalidate()
            titleLabel.text=" Time up!! "
            playSound()
            
        }
    }
  
  

}
