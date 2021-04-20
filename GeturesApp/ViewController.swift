//
//  ViewController.swift
//  GeturesApp
//
//  Created by Сергей Горейко on 01/04/2020.
//  Copyright © 2020 Сергей Горейко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
        Welcome to Gesture Recognizer !!!
        Perform some gesture to start
        """
        label.numberOfLines = 0
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        setupLabel()
        swipesObserver()
        tapObserver()
    }
    
    func setupLabel() {
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
    }
    
    func swipesObserver() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapObserver() {
        
        let trippleTap = UITapGestureRecognizer(target: self, action: #selector(trippleTapAction))
        trippleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(trippleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: trippleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
            case .right:
                label.text = "Right swipe was recognized"
            case .left:
                label.text = "Left swipe was recognized"
            case .up:
                label.text = "Up swipe was recognized"
            case .down:
                label.text = "Down swipe was recognized"
            default:
                break
        }
    }
    
    @objc func trippleTapAction() {
        label.text = "Tripple tap was recognized"
    }
    
    @objc func doubleTapAction() {
        label.text = "Double tap was recognized"
    }
}

