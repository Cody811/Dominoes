//
//  GameScene.swift
//  Dominoes
//
//  Created by Cody Edgington on 6/15/17.
//  Copyright © 2017 Cody Edgington. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    private var table : SKSpriteNode?
    private var dominoe : SKSpriteNode?
    
    override func didMove(to view: SKView) {
        

        var table = SKSpriteNode.init(color: UIColor.black, size:CGSize.init(width: 1000, height: 20));
        
        var tabPhys:SKPhysicsBody = SKPhysicsBody.init(rectangleOf: table.size);
        tabPhys.isDynamic = false;
        tabPhys.affectedByGravity = false;
        table.physicsBody = tabPhys;
        table.position.x = 0;
        table.position.y = -100
        
        self.addChild(table);
        
        
        self.dominoe = SKSpriteNode.init(color: UIColor.black, size: CGSize.init(width: 10, height: 100))
        
        if let dominoe = self.dominoe {
            var domPhys:SKPhysicsBody = SKPhysicsBody.init(rectangleOf: CGSize.init(width: 10, height: 100))
            domPhys.mass = 10.0;
            domPhys.affectedByGravity = true;
            domPhys.allowsRotation = true;
            
            dominoe.physicsBody = domPhys;
        }
        var i = 0;
        for i in -5 ... 5 {
            addTile(xCoord: CGFloat(50 * i));
        }
        
         physicsWorld.contactDelegate = self
        
    }
    
    func addTile(xCoord: CGFloat){
        if let n = self.dominoe?.copy() as! SKSpriteNode? {
            
            let displaySize: CGRect = UIScreen.main.bounds;
            
            n.position.x = xCoord;
            n.position.y = displaySize.height * 0.0;
            
            print(n.position);
            print(displaySize)
            //n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        /*if let n = self.dominoe?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }*/
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        /*if let n = self.dominoe?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }*/
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.dominoe?.copy() as! SKSpriteNode? {
            
            let displaySize: CGRect = UIScreen.main.bounds;
                
            n.position.x = pos.x;
            n.position.y = displaySize.height * 0.0;
            var act = SKAction.rotate(byAngle: -0.2, duration: 0)
            n.run(act);
            print(n.position);
            print(displaySize)
            //n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
