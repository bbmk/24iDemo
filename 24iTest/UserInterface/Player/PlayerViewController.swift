//
//  PlayerViewController.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 31.3.22.
//

import UIKit
import YouTubeiOSPlayerHelper

class PlayerViewController: UIViewController {
    @IBOutlet weak var playerView: YTPlayerView!
    var strYoutubeKey: String?
    
    init() {
        super.init(nibName: "PlayerViewController", bundle: nil)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //TODO: Should follow the same design practice as MovieCatalog and MovieDetails, for now I did shortcut
        playerView.delegate = self
        let playerVars = ["playsinline": 0, "autohide": 1, "showinfo": 0, "controls":1, "origin" : "http://youtube.com"] as [String : Any]
        if let strKey = strYoutubeKey {
            self.playerView.load(withVideoId: strKey, playerVars: playerVars)
        }
    }
}

extension PlayerViewController: YTPlayerViewDelegate{
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        if state == .ended {
            self.navigationController?.popViewController(animated: true)
        }
    }
    func playerView(_ playerView: YTPlayerView, didPlayTime playTime: Float) {
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
         print(playerView)
        self.playerView.playVideo()
    }
}
