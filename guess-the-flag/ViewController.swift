//
//  ViewController.swift
//  guess-the-flag
//
//  Created by Matthew Dolan on 2021-11-27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var totalQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        // example of UIColor and RGB.
        // button3.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // another option -> askQuestion(action: nil)
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
//        title = countries[correctAnswer].uppercased()
        title = "Flag - \(countries[correctAnswer].uppercased())" + "  Score - \(score)/\(totalQuestions) "
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            totalQuestions += 1
        } else {
            title = "Wrong!"
            score -= 1
            totalQuestions += 1
        }
        
        if totalQuestions == 10 {
            let ac = UIAlertController(title: title, message: "Your FINAL score is \(score)/\(totalQuestions).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Game Over!", style: .default, handler: nil))
            present(ac, animated: true)
        } else {
            // Apple recommends you use .alert when telling users about a situation change, and .actionSheet when asking them to choose from a set of options.
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            
            // There are three possible styles: .default, .cancel, and .destructive. What these look like depends on iOS, but it's important you use them appropriately because they provide subtle user interface hints to users.
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
}

