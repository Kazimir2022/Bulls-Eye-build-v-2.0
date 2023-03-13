//
//  ViewController.swift
//  Bulls Eye build 2
//
//  Created by Kazimir on 10.03.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    var currentValue:Int = 0
    var targetValue:Int = 0
    var score: Int = 0
    var round:Int = 0
    
    override func viewDidLoad() {
       super.viewDidLoad()
      let thumbImage = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImage, for: .normal)

     let size = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
     
     let leftTrack = UIImage(named: "SliderTrackLeft")!
     let leftTrackResizible = leftTrack.resizableImage(withCapInsets: size)
     slider.setMinimumTrackImage(leftTrackResizible, for: .normal)
        
        let rightTrack = UIImage(named: "SliderTrackRight")!
          let rightTrackResizible = rightTrack.resizableImage(withCapInsets: size)
          slider.setMaximumTrackImage(rightTrackResizible, for: .normal)
        
        startNewGame()
    }
    
    
    @IBAction func checkResult() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        
        let title:String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost hat it!"
            if difference < 1 {
                points += 25
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close...!"
        }
        
        score += points
        let message = "\nYour score: \(points)"
            
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style:.default)
        {_ in self.startNewRound()}
        alert.addAction(action)
        self.present(alert, animated: true)

    }
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
    }
  @IBAction  func startNewGame() {
    score = 0
    round = 0
    startNewRound()
        
    }
    
    func startNewRound(){
      
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
        
    }
   
    func updateLabel(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}

