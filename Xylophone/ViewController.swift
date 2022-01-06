//
//  ViewController.swift
//  Xylophone
//
//  Created by Vansh Bhatia on 1/6/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        //print(sender.currentTitle!)
        //print("I got pressed\n")
        sender.alpha=0.5
        //creating a new thread is better because using sleep freezes everything.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha=1//to reset back to normal
            self.playSound(fileName: sender.currentTitle!)
        }
        //print("Test")
        //As a new thread is formed, line 29 is executed first, then after the delay line 25 is executed
        
    }

    func playSound(fileName: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

    }


}



