//
//  GameViewController.swift
//  Dominoes
//
//  Created by Cody Edgington on 6/15/17.
//  Copyright © 2017 Cody Edgington. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
        
        var resetButton = UIButton.init();
        var resetFrame = CGRect.init(x: 10, y: 10, width: 100, height: 100);
        resetButton.frame = resetFrame;
        resetButton.setTitle("Reset", for: .normal);
        resetButton.backgroundColor = UIColor.brown;
        resetButton.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
        //resetButton.target(forAction:, withSender: <#T##Any?#>)
        self.view.addSubview(resetButton);
        
    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
