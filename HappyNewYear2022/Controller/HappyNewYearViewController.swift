//
//  HappyNewYearViewController.swift
//  HappyNewYear2022
//
//  Created by Koussaïla Ben Mamar on 31/12/2021.
//

import UIKit

class HappyNewYearViewController: UIViewController {

    @IBOutlet weak var happyNewYearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        happyNewYearLabel.text = NSLocalizedString("happyNewYear", comment: "Happy New Year 2022 label")
    }
    
    @IBAction func backToCountdown(_ sender: Any) {
        // Retour à la vue initiale (ViewController)
        dismiss(animated: true, completion: nil)
    }
}
