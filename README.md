# Bonne année 2022 iOS

2021 aura été une année vraiment difficile et qui nous aura bien affecté moralement, je vous propose ici une petite application iOS codée de façon authentique en natif avec Xcode 13 et Swift 5.5.

Très simple à réaliser (avec UIKit), il vous suffira dans le Storyboard de mettre en place 2 `ViewController`, des labels, un bouton et une image, le tout adapté aux formats d'écrans avec Auto Layout **(note: pour plus d'optimalité, avec les iPad, les Size Classes sont à utiliser)**.

Le bouton du compte à rebours déclenché, le décompte de 10 à 0 va se faire. La fonction `@objc`countdown fait office de thread et se déclenche toutes les secondes via les 3 paramètres de `Timer.scheduledTimer()` qui sont `timeInterval: 1` et le sélecteur de fonction `#selector(ViewController.countdown)` avec la répétition activée `repeats: true`.

En effectuant un push pour aller dans la seconde vue, le paramètre `modalPresentationStyle = .fullScreen` est utilisé afin d'avoir un écran complet au lieu d'une simple vue en onglet vertical qu'on peut fermer avec un swipe.

**ATTENTION: Ne pas oublier d'ajouter "HappyNewYear" dans le `StoryboardID` depuis l'onglet Identity Inspector**

```swift
@IBAction func countdownButton(_ sender: Any) {
    countdownTimer.invalidate()
    seconds = 10

    // Compte à rebours activé, le bouton disparaît
    timer.isHidden = false
    timerButton.isHidden = true

    // Compte à rebours, la fonction Objective-C countdown se déclenche toute les secondes avec le paramètre timeInterval à 1.
    countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
}

@objc func countdown() {
    seconds -= 1
    timer.text = String(seconds)

    if seconds == 0 {
        timerButton.isHidden = false
        timer.isHidden = true
        timer.text = "10"  // Si on souhaite recommencer, sinon on voit "0"
        countdownTimer.invalidate() // Le compteur est désactivé.

        // On s'assure que le ViewController pour l'image festive soit présente
        guard let vc = storyboard?.instantiateViewController(identifier: "HappyNewYear") as? HappyNewYearViewController else {
            return
        }

        vc.modalPresentationStyle = .fullScreen  // Écran complet
        present(vc, animated: true) // On transite sur l'autre vue pour souhaiter "Bonne année 2021"
    }
}
```

**En bonus, cette application est disponible en 3 langues:**
- Français
- Anglais
- Arabe

L'internationalisation de l'application se fait grâce aux fichiers `.strings` et pour appliquer aux différents éléments, on utilise `NSLocalizedString`:
```swift
happyNewYearLabel.text = NSLocalizedString("happyNewYear", comment: "Happy New Year 2022 label")
```

**Voilà :)**

**En toutes circonstances, je vous souhaite une très bonne année 2022, bonne santé, meilleurs vœux, qu'elle nous fasse oublier l'année 2022 marquée par le ravage mondial du COVID-19 et ses variants (Alpha, Delta, Omicron,...).**
