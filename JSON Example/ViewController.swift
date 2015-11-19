//
//  ViewController.swift
//  JSON Example
//
//  Created by Hema Pillay on 11/4/15.
//  Copyright © 2015 PACKSHI BIZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlText = "http://www.telize.com/geoip"
        
        if let url = NSURL(string: urlText) {
        
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
         
                if let urlContent = data {
                    
                    do {
                        let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                        
                        print(jsonResult["city"]!)
                        
                    } catch {}
                    
 
                }
            
            }
            task.resume()
        }
        
        /*
        if let url = NSURL(string: urlText) {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                if (error != nil) {
                    print(error)
                    
                }
                else {
                    if let bach = UIImage(data: data!) {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            // now that we have saved the image in directory -
                            //self.image.image = bach
                        })
                    }
                    
                    var documentsDirectory:String?
                    
                    var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                    
                    if paths.count > 0 {
                        
                        documentsDirectory = paths[0] as? String
                        
                        let savePath = documentsDirectory! + "/bach.jpg"
                        
                        NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                        
                        self.image.image = UIImage(named: savePath)
                        
                    }
                    
                }
                
            }
            task.resume()
            
        }
        else {
            print("Could not make url address")
        }
*/
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

