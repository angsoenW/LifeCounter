//
//  ViewController.swift
//  LifeCounter
//
//  Created by Jasper Wang on 4/17/24.
//

import UIKit
var history:[(Int, Int)] = []

class ViewController: UIViewController {
    var userData:[(Int, Int)] = []
    
    @IBOutlet weak var EditPlayer: UIStackView!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var Hist: UIStackView!
    
    /*
     

     */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        if stack != nil{
            for _ in 1...4 {
                userData.append((userData.count + 1, 20))
                let newPlayerView = PlayerView()
                newPlayerView.playerNameLabel.text = "Player \(userData.count)"
                newPlayerView.translatesAutoresizingMaskIntoConstraints = false
                let index = self.userData.count - 1
                let actionMinus3 = UIAction { action in
                    self.userData[index].1 = self.userData[index].1 - 3
                    if self.userData[index].1 <= 0 {
                        let alert = UIAlertController(title: "Game Over!", message: "Player \(index + 1) has lost!", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                            for i in 0...self.userData.count - 1 {
                                let view = self.stack.arrangedSubviews[i] as! ViewController.PlayerView
                                view.scoreLabel.text = "20"
                                self.userData[i].1 = 20
                            }
                            self.EditPlayer.isHidden = false
                        }
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                    newPlayerView.scoreLabel.text = String(self.userData[index].1)
                    history.append((index, -3))
                }
                let actionMinus1 = UIAction { action in
                    self.userData[index].1 = self.userData[index].1 - 1
                    if self.userData[index].1 <= 0 {
                        let alert = UIAlertController(title: "Game Over!", message: "Player \(index + 1) has lost!", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                            for i in 0...self.userData.count - 1 {
                                let view = self.stack.arrangedSubviews[i] as! ViewController.PlayerView
                                view.scoreLabel.text = "20"
                                self.userData[i].1 = 20
                            }
                            self.EditPlayer.isHidden = false
                        }
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                    history.append((index, -1))
                    newPlayerView.scoreLabel.text = String(self.userData[index].1)
                }
                let actionPlus1 = UIAction { action in
                    self.userData[index].1 = self.userData[index].1 + 1
                    newPlayerView.scoreLabel.text = String(self.userData[index].1 + 1)
                    history.append((index, 1))
                }
                let actionPlus3 = UIAction { action in
                    self.userData[index].1 = self.userData[index].1 + 3
                    newPlayerView.scoreLabel.text = String(self.userData[index].1 + 3)
                    history.append((index, 3))
                }
                newPlayerView.minusThreeButton.addAction(actionMinus3, for: .touchUpInside)
                newPlayerView.minusOneButton.addAction(actionMinus1, for: .touchUpInside)
                newPlayerView.plusOneButton.addAction(actionPlus1, for: .touchUpInside)
                newPlayerView.plusThreeButton.addAction(actionPlus3, for: .touchUpInside)
                stack.addArrangedSubview(newPlayerView)
            }
        }
        if Hist != nil {
            Hist.arrangedSubviews.forEach { $0.removeFromSuperview() }
            
            // Check if the history is empty
            if history.isEmpty {
                let noHistoryLabel = UILabel()
                noHistoryLabel.text = "No history yet."
                noHistoryLabel.textAlignment = .center
                noHistoryLabel.font = UIFont.systemFont(ofSize: 16)
                noHistoryLabel.textColor = .gray // Optional: Make it gray to indicate no data
                
                // Add the 'no history' label to the stack view
                Hist.addArrangedSubview(noHistoryLabel)
            } else {
                // Iterate over the history array and create labels
                for entry in history {
                    let historyLabel = UILabel()
                    if entry.1 < 0 {
                        historyLabel.text = "Player \(entry.0) lost \(entry.1 * -1) life"
                    } else {
                        historyLabel.text = "Player \(entry.0) gained \(entry.1) life"
                    }
                    
                    historyLabel.textAlignment = .center
                    historyLabel.font = UIFont.systemFont(ofSize: 16)
                    
                    // Add the label to the stack view
                    Hist.addArrangedSubview(historyLabel)
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddPlayer(_ sender: UIButton) {
        if userData.count < 8 {
            userData.append((userData.count + 1, 20))
            let newPlayerView = PlayerView()
            newPlayerView.playerNameLabel.text = "Player \(userData.count)"
            newPlayerView.translatesAutoresizingMaskIntoConstraints = false
            let index = self.userData.count - 1
            let actionMinus3 = UIAction { action in
                self.userData[index].1 = self.userData[index].1 - 3
                if self.userData[index].1 <= 0 {
                    let alert = UIAlertController(title: "Game Over!", message: "Player \(index + 1) has lost!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                        for i in 0...self.userData.count - 1 {
                            let view = self.stack.arrangedSubviews[i] as! ViewController.PlayerView
                            view.scoreLabel.text = "20"
                            self.userData[i].1 = 20
                        }
                        self.EditPlayer.isHidden = false
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                }
                history.append((index, -3))
                newPlayerView.scoreLabel.text = String(self.userData[index].1)
            }
            
            let actionMinus1 = UIAction { action in
                self.userData[index].1 = self.userData[index].1 - 1
                if self.userData[index].1 <= 0 {
                    let alert = UIAlertController(title: "Game Over!", message: "Player \(index + 1) has lost!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                        for i in 0...self.userData.count - 1 {
                            let view = self.stack.arrangedSubviews[i] as! ViewController.PlayerView
                            view.scoreLabel.text = "20"
                            self.userData[i].1 = 20
                        }
                        self.EditPlayer.isHidden = false
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                }
                history.append((index, -1))
                newPlayerView.scoreLabel.text = String(self.userData[index].1)
            }
            
            let actionPlus1 = UIAction { action in
                self.userData[index].1 = self.userData[index].1 + 1
                history.append((index, 1))
                newPlayerView.scoreLabel.text = String(self.userData[index].1 + 1)
            }
            
            let actionPlus3 = UIAction { action in
                self.userData[index].1 = self.userData[index].1 + 3
                history.append((index, 3))
                newPlayerView.scoreLabel.text = String(self.userData[index].1 + 3)
            }
            
            newPlayerView.minusThreeButton.addAction(actionMinus3, for: .touchUpInside)
            newPlayerView.minusOneButton.addAction(actionMinus1, for: .touchUpInside)
            newPlayerView.plusOneButton.addAction(actionPlus1, for: .touchUpInside)
            newPlayerView.plusThreeButton.addAction(actionPlus3, for: .touchUpInside)
            stack.addArrangedSubview(newPlayerView)
        } else {
            let alert = UIAlertController(title: "No More Than 8!", message: "Maximum number of players reached.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    
    @IBAction func Start(_ sender: UIButton) {
        EditPlayer.isHidden = true
    }
    
    @IBAction func DeletePlayer(_ sender: UIButton) {
        if userData.count > 2 {
            userData.remove(at: userData.count - 1)
            let view = stack.arrangedSubviews[stack.arrangedSubviews.count - 1]
            view.removeFromSuperview()
        } else {
            let alert = UIAlertController(title: "No Less Than 2!", message: "Minimum number of players reached.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    class PlayerView: UIView {
        
        // Initialize UI elements
        let playerNameLabel = UILabel()
        let scoreLabel = UILabel()
        let minusThreeButton = UIButton()
        let minusOneButton = UIButton()
        let plusOneButton = UIButton()
        let plusThreeButton = UIButton()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)

            playerNameLabel.text = "Player "
            playerNameLabel.textColor = .systemYellow
            playerNameLabel.textAlignment = .center
            playerNameLabel.font = UIFont.systemFont(ofSize: 20)
            
            scoreLabel.text = "20"
            scoreLabel.textColor = .systemYellow
            scoreLabel.textAlignment = .center
            scoreLabel.font = UIFont.systemFont(ofSize: 55)
            
            configureButton(minusThreeButton, title: "-3", color: .systemYellow)
            configureButton(minusOneButton, title: "-1", color: .systemYellow)
            configureButton(plusOneButton, title: "+1", color: .systemYellow)
            configureButton(plusThreeButton, title: "+3", color: .systemYellow)
            
            let buttonStackView = UIStackView(arrangedSubviews: [minusThreeButton, minusOneButton, scoreLabel, plusOneButton, plusThreeButton])
            buttonStackView.axis = .horizontal
            buttonStackView.distribution = .fillEqually
            buttonStackView.alignment = .center
            buttonStackView.spacing = 10
            buttonStackView.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(playerNameLabel)
            addSubview(buttonStackView)
            
            playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                playerNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                playerNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                
                buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                buttonStackView.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor, constant: 10)
            ])
            
            self.backgroundColor = .systemPurple
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configureButton(_ button: UIButton, title: String, color: UIColor) {
            button.setTitle(title, for: .normal)
            button.backgroundColor = color
            button.setTitleColor(.systemPurple, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
            button.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}

