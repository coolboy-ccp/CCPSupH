//
//  ViewController.swift
//  CCPSupH
//
//  Created by Ceair on 17/3/14.
//  Copyright © 2017年 ceair-imac. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         extension初始化
         */
        let sv = UIView(frame: CGRect.zero, exWH: (10,10))
        sv.backgroundColor = UIColor.red
        sv.center = view.center
        view.addSubview(sv)
        let colors = [UIColor.white,UIColor.orange,UIColor.purple,UIColor.green,UIColor.brown]
        for i in 0 ..< 5 {
            let v = UIView(frame: CGRect(x: 10, y: 10 + 60 * i, width: 130, height: 50))
            v.backgroundColor = colors[i]
            v.layer.cornerRadius = 5.0
            sv.addSubview(v)
        }
        
        /*
         system初始化
         */
        let sv1 = UIView()
        sv1.backgroundColor = UIColor.red
        view.addSubview(sv1)
        sv1.center = CGPoint(x: view.center.x, y: 60)
        for i in 0 ..< 5 {
            let v = UIView(frame: CGRect(x: 10 + 15 * i, y: 5, width: 10, height: 30))
            v.backgroundColor = colors[i]
            v.layer.cornerRadius = 5.0
            sv1.addSubview(v)
        }
        sv1.adaptionWH((5,10))

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

