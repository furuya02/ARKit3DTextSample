//
//  ViewController.swift
//  ARKit3DTextSample
//
//  Created by . SIN on 2017/09/16.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView.delegate = self
        //sceneView.showsStatistics = true
        
        sceneView.scene = SCNScene()
        sceneView.autoenablesDefaultLighting = true

        let str = "本日は晴天なり"
        let depth:CGFloat = 0.5
        let text = SCNText(string: str, extrusionDepth: depth)
        text.font = UIFont(name: "HiraKakuProN-W6", size: 0.5);
        let textNode = SCNNode(geometry: text)
        
        let (min, max) = (textNode.boundingBox)
        let x = CGFloat(max.x - min.x)
        let y = CGFloat(max.y - min.y)
        textNode.position = SCNVector3(-(x/2), -1, -2)
        
        print("\(str) width=\(x)m height=\(y)m depth=\(depth)m")

        sceneView.scene.rootNode.addChildNode(textNode)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
}
