//
//  ViewController.swift
//  MyPlayer
//
//  Created by Luis Javier Canto Hurtado on 28/04/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "jinglebells", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        
        do{
            player = try AVAudioPlayer(contentsOf: url as URL)
            player?.prepareToPlay()
            player?.delegate = self
        } catch {
            print("Error while creating the player")
        }
    }

    @IBAction func changeVolume(_ sender: Any) {
        player?.volume = slider.value
    }
    
    
    @IBAction func playPause(_ sender: Any) {
        if (player?.isPlaying)!{
            player?.stop()
            let imagePlay = UIImage(named: "play")
            button.setImage(imagePlay, for: .normal)
            //button.setTitle("Play", for: .normal)
        } else {
            player?.play()
            let imagePause = UIImage(named: "pause")
            button.setImage(imagePause, for: .normal)
           // button.setTitle("Pause", for: .normal)
        }
    }
    
    
    @IBAction func previous(_ sender: Any) {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "bensoundmemories", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        img.image = UIImage(named: "memories")
        
        do{
            player = try AVAudioPlayer(contentsOf: url as URL)
            player?.prepareToPlay()
            player?.delegate = self
        } catch {
            print("Error while creating the player")
        }
    }
    
    @IBAction func nextSong(_ sender: Any) {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "bensoundslowmotion", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        img.image = UIImage(named: "slowmotion")
        
        do{
            player = try AVAudioPlayer(contentsOf: url as URL)
            player?.prepareToPlay()
            player?.delegate = self
        } catch {
            print("Error while creating the player")
        }
    }
}

