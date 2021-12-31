//
//  ViewController.swift
//  HappyNewYear2022
//
//  Created by Koussaïla Ben Mamar on 31/12/2021.
//

import UIKit

class CountdownViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var countdownButton: UIButton!
    
    var countdownTimer = Timer()
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.isHidden = true
        countdownButton.titleLabel?.text = NSLocalizedString("countdown", comment: "Countdown button label")
    }
    
    @IBAction func fireCountdown(_ sender: Any) {
        countdownTimer.invalidate()
        seconds = 10
        
        // Compte à rebours activé, le bouton disparaît
        timerLabel.isHidden = false
        countdownButton.isHidden = true
        
        // Compte à rebours, la fonction Objective-C countdown se déclenche toute les secondes avec le paramètre timeInterval à 1.
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountdownViewController.countdown), userInfo: nil, repeats: true)
    }
    
    
    @objc func countdown() {
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if seconds == 0 {
            countdownButton.isHidden = false
            timerLabel.isHidden = true
            timerLabel.text = "10" // Si on souhaite recommencer, sinon on voit "0"
            countdownTimer.invalidate() // Le compteur est désactivé.
            
            // On s'assure que le ViewController pour l'image festive soit présente
            guard let vc = storyboard?.instantiateViewController(identifier: "HappyNewYear") as? HappyNewYearViewController else {
                print("Erreur: ViewController non détecté dans le storyboard")
                return
            }
            
            vc.modalPresentationStyle = .fullScreen // Écran complet
            present(vc, animated: true) // On transite sur l'autre vue pour souhaiter "Bonne année 2022"
        }
    }
}
