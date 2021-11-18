//
//  ViewController.swift
//  StopWatch
//
//  Created by Mac on 11/11/21.
//

import UIKit
import  Foundation
class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var startStopBtn: UIButton!
    var timer : Timer?
    var isStarted = false
    var counter = 0.0
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @objc  func updateTimerLabel(){
        counter += 0.1
        timeLabel.text = String(round(counter*10)/10)
    }
    @IBAction func startStopDidTouch(_ sender: Any) {
        if isStarted{
            timer?.invalidate()
            isStarted = false
            startStopBtn.setTitle("Start", for: .normal)
        }else{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
            isStarted = true
            startStopBtn.setTitle("Stop", for: .normal)
        }
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        counter = 0.0
        
        if isStarted {
            timer?.invalidate()
            startStopBtn.setTitle("Start", for: .normal)
            isStarted = false
        }
    }
}
