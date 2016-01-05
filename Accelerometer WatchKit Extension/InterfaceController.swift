//
//  InterfaceController.swift
//  Accelerometer WatchKit Extension
//
//  Created by Hu on 11/19/15.
//  Copyright © 2015 HuLi. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion


class InterfaceController: WKInterfaceController {
    
    let motionManager = CMMotionManager()


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        
        // Configure interface objects here.
    }

    
    
    @IBAction func Go() {
        //print("Go!")
        
        
        motionManager.accelerometerUpdateInterval = 0.001
        
        if (motionManager.accelerometerAvailable == true) {
            let handler:CMAccelerometerHandler = {(data: CMAccelerometerData?, error: NSError?) -> Void in
                //print("a")
                print(String(format: "%.4f", data!.acceleration.x))
                //print(String(format: "%.2f", data!.acceleration.y))
                //print(String(format: "%.4f", data!.acceleration.z))
            }
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: handler)
        }
        else {
            print("not available")

        }
        
        

        
        
    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
            }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        //print("End")
        
         //motionManager.stopAccelerometerUpdates()
        
        
        
    }

}
