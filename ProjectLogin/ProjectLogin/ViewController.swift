//
//  ViewController.swift
//  ProjectLogin
//
//  Created by TranTPhuong on 2/7/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var playerLayer:AVPlayerLayer!
    var timer:Timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playerLayer = AVPlayerLayer()
//        let url:URL = URL(string: "http://thaihuynhcong.pe.hu/Video/SING%20-%20Teaser%20Trailer.mp4")!
        
        let path = Bundle.main.path(forResource: "spiderman", ofType: "mp4")
        
        let url:URL = URL(fileURLWithPath: path!)
        playerLayer.player = AVPlayer(url: url)
        view.layer.insertSublayer(playerLayer, at: 0)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        playerLayer.videoGravity = AVLayerVideoGravityResize
        
        playerLayer.player?.play()
        loopVideo()
    }
    
    func loopVideo() {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.playerLayer.player?.currentItem, queue: nil) { (_) in
            DispatchQueue.main.async {
                self.playerLayer.player?.seek(to: kCMTimeZero)
                self.playerLayer.player?.play()
            }
        }
    }
   
    override func viewDidAppear(_ animated: Bool) {
        
    }

    @IBAction func signUpPressed(_ sender: Any) {
        let registerVC:RegisterVC = storyboard?.instantiateViewController(withIdentifier: "register") as! RegisterVC
        self.navigationController?.pushViewController(registerVC, animated: true)
        
    }
    
    

}



