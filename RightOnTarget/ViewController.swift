//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Руслан on 06.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var gameManager: Game!
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    //загаданное число
    var number: Int = 0
    
    //раунд
    var round: Int = 1
    
    //сумма очков за раунд
    var points: Int = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        gameManager = Game(rounds: 5)
        updateLabelWithSecretNumber(newText: gameManager.currentSecretValue)
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    @IBAction func checkNumber() {
//        if self.round == 0 {
//            self.number = Int.random(in: 1...50)
//            self.label.text = String(self.number)
//            self.round = 1
//        } else {
            let numSlider = Int(self.slider.value.rounded())
            gameManager?.calculateScore(with: Int(numSlider))
        if gameManager.round.isGameEnded {
                showAlertWith(score: gameManager.score)
                gameManager.restartGame()
            } else {
                gameManager.startNewRound()
            }
            updateLabelWithSecretNumber(newText: gameManager.currentSecretValue)
//        }
    }

    @IBAction func showNextScreen() {
//        let viewController = SecondViewController()
//
//        self.present(viewController, animated: true, completion: nil)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
//        self.present(viewController, animated: true, completion: nil)
        
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func updateLabelWithSecretNumber(newText: Int) {
        label.text = String(newText)
    }
    
    func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

