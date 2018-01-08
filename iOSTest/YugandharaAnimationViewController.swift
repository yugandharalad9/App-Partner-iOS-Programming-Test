//
//  YugandharaAnimationViewController.swift
//  iOSTest
//
//  Created by Yugandhara Lad More on 1/5/18.
//  Copyright © 2018 AppPartner. All rights reserved.
//

import UIKit
import AVFoundation

class YugandharaAnimationViewController: UIViewController {

    @IBOutlet weak var Gangnam: UIImageView!
    @IBOutlet weak var endButtonPressed: UIButton!
    
    
    var audioPlayer = AVAudioPlayer()
    
    let mp3Path = Bundle.main.path(forResource: "tu Jo Mila cover by Yugandhara", ofType: "mp3")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: mp3Path!))
            audioPlayer.play()
        } catch {
            // Error: File not loaded
            print("mp3 file not loaded")
        }
        
        
        var gangnamNames = ["win_1", "win_2","win_3", "win_4","win_5", "win_6","win_7", "win_8","win_9","win_10", "win_11","win_11","win_12", "win_13","win_14","win_15", "win_16"]
        
        var  GangnamImages = [UIImage] ()

        for i in 0..<gangnamNames.count {
            GangnamImages.append(UIImage(named: gangnamNames[i])!)
        }
        Gangnam.animationImages = GangnamImages
        Gangnam.animationDuration = 1.0
        Gangnam.startAnimating()
        
    }

    @IBAction func endButtonPressed(_ sender: UIButton) {
        audioPlayer.pause()
        dismiss(animated: true, completion: nil)
    }
    
    


}
