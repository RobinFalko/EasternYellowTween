//
//  Elastic.swift
//  Ubergang
//
//  Created by Robin Frielingsdorf on 10/01/16.
//  Copyright © 2016 Robin Falko. All rights reserved.
//

import Foundation

open class Elastic: Ease {
    
    /**
     Elastic ease in.
     
     - Parameter t: The value to be mapped going from 0 to `d`
     - Parameter b: The mapped start value
     - Parameter c: The mapped end value
     - Parameter d: The end value
     - Returns: The mapped result
     */
    open class func easeIn(t: Double, b: Double, c: Double, d: Double) -> Double {
        var t = t
        if t == 0 {
            return b
        }
        
        t = t / d
        if t == 1 {
            return b+c
        }
        
        let p = d * 0.3
        let a = c
        let s = p / 4
        t = t - 1
        
        let postFix = a * pow(2.0, 10.0 * t) // this is a fix, again, with post-increment operators
        
        return -(postFix * sin((t*d-s) * (2 * .pi)/p )) + b
    }
    
    /**
     Elastic ease out.
     
     - Parameter t: The value to be mapped going from 0 to `d`
     - Parameter b: The mapped start value
     - Parameter c: The mapped end value
     - Parameter d: The end value
     - Returns: The mapped result
     */
    open class func easeOut(t: Double, b: Double, c: Double, d: Double) -> Double {
        var t = t
        if t == 0 {
            return b
        }
        
        t = t / d
        if t == 1 {
            return b+c
        }
        
        let p = d * 0.3
        let a = c
        let s = p / 4
        
        return (a * pow(2, -10 * t) * sin( (t*d-s) * (2 * .pi)/p ) + c + b)
    }
    
    /**
     Elastic ease in out.
     
     - Parameter t: The value to be mapped going from 0 to `d`
     - Parameter b: The mapped start value
     - Parameter c: The mapped end value
     - Parameter d: The end value
     - Returns: The mapped result
     */
    open class func easeInOut(t: Double, b: Double, c: Double, d: Double) -> Double {
        var t = t
        if t == 0 {
            return b
        }
        
        t = t / (d / 2)
        if t == 2 {
            return b+c
        }
        
        let p = d * (0.3*1.5)
        let a = c
        let s = p / 4
        
        t = t - 1
        
        if (t < 1) {
            let postFix = a * pow(2.0, 10.0 * t) // postIncrement is evil
            return -0.5 * (postFix * sin((t*d-s) * (2 * .pi)/p)) + b
        }
        
        let postFix = a * pow(2.0, -10.0 * t) // postIncrement is evil
        return postFix * sin((t*d-s) * (2 * .pi) / p) * 0.5 + c + b
    }
}
