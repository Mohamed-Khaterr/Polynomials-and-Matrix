//
//  Brain.swift
//  Polynomials
//
//  Created by Khater on 5/5/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import Foundation


class Polynomials{
    var xr: Double = 0.0
    var xold: Double = 0.0
    var xPlus: Double = 0.0
    var er: Double = 0.0
    var x: Double = 0.0
    var counter: Int = 0
    var result: String = ""
    
    func powValue(_ x:Double,_ y:Int) -> Double{
        var result:Double = 1
        for _ in 1...y{
            result *= x
        }
        return result
    }
    
    func check(fun: String, xl: Double?, xu: Double?, iter: Int?, eps: Double?) -> Bool {
        if fun != "" && xu != nil && xl != nil{
            if iter != nil || eps != nil{
                return true
            }else{
                return false
            }
        }else{
            return false
        }
    }

    func f(x: Double, string: String) -> Double{
        var converted:String = ""
        var char = Array(string)
        var i = 0
        var temp = ""
        var pow = [String]()
        var stringArray = [String]()
        var number = 0.0
        
        
        
        //this loop to add * between number and X
        for item in char{
            if item == "X" && char[i - 1] != " "{
                char.insert(" ", at: i)
                char.insert("*", at: i)
                char.insert(" ", at: i)
                i += 3
            }
            i += 1
        }
        converted = String(char)
        //check power
        for item in 0..<char.count{
            if char[item] == "^"{
                i = item
                repeat{
                    i += 1
                    if char[i] != " "{
                        temp += String(char[i])
                    }
                    
                }while char[i] != " "
                stringArray.append(String(temp))
                temp = ""
            }
        }
        
        //Calculate each power of X
        for item in stringArray{
            number = powValue(x,Int(item) ?? 0)
            pow.append(String(number))
        }
        
        i = 0
        for item in char{
            if item == "^"{
                char.remove(at: i)
                char.remove(at: i)
                i -= 2
            }
            i += 1
        }

        converted = String(char)
        var z = converted.components(separatedBy: " ")

        
        //X^2
        //pow(x,2)
        i = 0
        var j = 0
        for item in z{
            if item == "X"{
                if j < pow.count{
                    z.remove(at: i)
                    z.insert(pow[j], at: i)
                }else{
                    z.remove(at: i)
                    z.insert(String(x), at: i)
                }
                j += 1
            }
            i += 1
        }
        
        converted = z.joined(separator:" ")
        
        //string -> function
        let expression = NSExpression(format:converted)
        let value = expression.expressionValue(with: nil, context: nil) as? Double

        return value ?? 0.0
    }
    
    func bisection(xl: Double, xu: Double, eps: Double, fun: String){
        var xL = xl
        var xU = xu
        
        repeat{
            xold = xr
            xr = (xL + xU)/2

            result += "iteration \(counter)\n"
            result += "xl    = \(String(format: "%.3f",xL)) \n "
            result += "ƒ(xl) = \(String(format: "%.3f",f(x: xL, string: fun))) \n "
            result += "xu    = \(String(format: "%.3f",xU)) \n "
            result += "ƒ(xu) = \(String(format: "%.3f",f(x: xU, string: fun))) \n "
            result += "xr    = \(String(format: "%.3f",xr)) \n "
            result += "ƒ(xr) = \(String(format: "%.3f",f(x: xr, string: fun))) \n "

            if f(x: xL, string: fun) * f(x: xr, string: fun) < 0{
                xU = xr
            }else if f(x: xL, string: fun) * f(x: xr, string: fun) > 0{
                xL = xr
            }
            
            er = (abs((xr - xold)/xr)*100)
            result += "er  = \(String(format: "%.3f",er ))%\n"
            
            result += "---------------------------------\n"
            counter += 1
        }while eps < er

    }
    
    func bisectionWithIteration(xl: Double, xu: Double, iter: Int, fun: String){
        var xL = xl
        var xU = xu
        
        repeat{
            xold = xr
            xr = (xL + xU)/2

            result += "iteration \(counter) \n "
            result += "xl    = \(String(format: "%.3f",xL)) \n "
            result += "ƒ(xl) = \(String(format: "%.3f",f(x: xL, string: fun))) \n "
            result += "xu    = \(String(format: "%.3f",xU)) \n "
            result += "ƒ(xu) = \(String(format: "%.3f",f(x: xU, string: fun))) \n "
            result += "xr    = \(String(format: "%.3f",xr)) \n "
            result += "ƒ(xr) = \(String(format: "%.3f",f(x: xr, string: fun))) \n "
            if f(x: xL, string: fun) * f(x: xr, string: fun) < 0{
                xU = xr
            }else if f(x: xL, string: fun) * f(x: xr, string: fun) > 0{
                xL = xr
            }
            
            er = (abs((xr - xold)/xr)*100)
            result += "er  = \(er)% \n "

            result += "--------------------------------- \n "
            counter += 1
        }while counter != iter + 1

    }
    
    func falsePosition(xl: Double, xu: Double, eps: Double, fun: String){
        var xL = xl
        var xU = xu
        
        repeat{
            xold = xr
            xr = xU - ((f(x: xU, string: fun) * (xL - xU)) / (f(x: xL, string: fun) - f(x: xU, string: fun)))

            result += "iteration \(counter)\n"
            result += "xl    = \(String(format: "%.3f",xL)) \n "
            result += "ƒ(xl) = \(String(format: "%.3f",f(x: xL, string: fun))) \n "
            result += "xu    = \(String(format: "%.3f",xU)) \n "
            result += "ƒ(xu) = \(String(format: "%.3f",f(x: xU, string: fun))) \n "
            result += "xr    = \(String(format: "%.3f",xr)) \n "
            result += "ƒ(xr) = \(String(format: "%.3f",f(x: xr, string: fun))) \n "

            if f(x: xL, string: fun) * f(x: xr, string: fun) < 0{
                xU = xr
            }else if f(x: xL, string: fun) * f(x: xr, string: fun) > 0{
                xL = xr
            }
            
            er = (abs((xr - xold)/xr)*100)
            result += "er  = \(er)%\n"
            
            result += "---------------------------------\n"
            counter += 1
        }while eps < er

    }
    
    func falsePositionIteration(xl: Double, xu: Double, iter: Int, fun: String){
        var xL = xl
        var xU = xu
        
        repeat{
            xold = xr
            xr = xU - ((f(x: xU, string: fun) * (xL - xU)) / (f(x: xL, string: fun) - f(x: xU, string: fun)))

            result += "iteration \(counter) \n "
            result += "xl    = \(String(format: "%.3f",xL)) \n "
            result += "ƒ(xl) = \(String(format: "%.3f",f(x: xL, string: fun))) \n "
            result += "xu    = \(String(format: "%.3f",xU)) \n "
            result += "ƒ(xu) = \(String(format: "%.3f",f(x: xU, string: fun))) \n "
            result += "xr    = \(String(format: "%.3f",xr)) \n "
            result += "ƒ(xr) = \(String(format: "%.3f",f(x: xr, string: fun))) \n "
            if f(x: xL, string: fun) * f(x: xr, string: fun) < 0{
                xU = xr
            }else if f(x: xL, string: fun) * f(x: xr, string: fun) > 0{
                xL = xr
            }
            
            er = (abs((xr - xold)/xr)*100)
            result += "er  = \(String(format: "%.3f", er))% \n "

            result += "--------------------------------- \n "
            counter += 1
        }while counter != iter + 1
        
    }
    
    func simpleFixedPoint(x: Double, eps: Double, fun: String){
        var square = fun
        
        if let range = square.range(of: "√") {
           square.removeSubrange(range)
            xPlus = f(x: x, string: square).squareRoot()
        }else{
            xPlus = f(x: x, string: square)
        }
        
        
        er = (abs((xPlus - x)/xPlus)*100)
        
        result += "iteration \(counter)\n"
        result += "Xi =\(String(format: "%.3f", xPlus))\n"
        result += "er =\(String(format: "%.3f", er)) %\n"
        result += "-------------------------------\n"
        
        counter += 1
        
        if er > eps{
            simpleFixedPoint(x: xPlus, eps: eps, fun: fun)
        }
    }
    
    func simpleFixedPointWithIter(x: Double, iter: Int, fun: String){
        var square = fun
        
        if let range = square.range(of: "√") {
           square.removeSubrange(range)
            xPlus = f(x: x, string: square).squareRoot()
        }else{
            xPlus = f(x: x, string: square)
        }
        
        
        er = (abs((xPlus - x)/xPlus)*100)
        
        result += "iteration \(counter)\n"
        result += "Xi = \(String(format: "%.3f", xPlus))\n"
        result += "er = \(String(format: "%.3f", er)) %\n"
        result += "-------------------------------\n"
        
        counter += 1
        
        if counter <= iter{
            simpleFixedPointWithIter(x: xPlus, iter: iter, fun: fun)
        }
    }
    
    func newton(x: Double, eps: Double, funDash: String, fun: String){
        
        xPlus = x - (f(x: x, string: fun)/f(x: x, string: funDash))
        
        result += "iteration \(counter)\n"
        result += "Xi     = \(String(format: "%.3f", x))\n"
        result += "ƒ(Xi)  = \(String(format: "%.3f",f(x: x, string: fun)))\n"
        result += "ƒ´(Xi) = \(String(format: "%.3f",f(x: x, string: funDash)))\n"
        result += "er     = \(String(format: "%.3f", er)) %\n"
        result += "-------------------------------\n"

        
        er = (abs((xPlus - x)/xPlus)*100)
        
        counter += 1
        
        if er > eps {
             newton(x: xPlus, eps: eps, funDash: funDash, fun: fun)
        }
    }
    
    func newtonWithIter(x: Double, iter: Int, funDash: String, fun: String){
        
        xPlus = x - (f(x: x, string: fun)/f(x: x, string: funDash))
        
        result += "iteration \(counter)\n"
        result += "Xi     = \(String(format: "%.3f", x))\n"
        result += "ƒ(Xi)  = \(String(format: "%.3f",f(x: x, string: fun)))\n"
        result += "ƒ´(Xi) = \(String(format: "%.3f",f(x: x, string: funDash)))\n"
        result += "er     = \(String(format: "%.3f", er)) %\n"
        result += "-------------------------------\n"

        
        er = (abs((xPlus - x)/xPlus)*100)
        
        counter += 1
        
        if iter >= counter{
             newtonWithIter(x: xPlus, iter: iter, funDash: funDash, fun: fun)
        }
    }
    
    func secant(xo: Double,xMinus: Double, eps: Double, fun: String){
        var x1 = xo
        var x2 = xMinus
        x = x1 - ((f(x: x1, string: fun) * (x2 - xo))/(f(x: x2, string: fun) - f(x: x1, string: fun)))
        
        result += "iteration \(counter)\n"
        result += "X-1   = \(String(format: "%.3f", x2))\n"
        result += "ƒ(X-1)= \(String(format: "%.3f",f(x: x2, string: fun)))\n"
        result += "Xi    = \(String(format: "%.3f", x1))\n"
        result += "ƒ(Xi) = \(String(format: "%.3f",f(x: x1, string: fun)))\n"
        result += "er    = \(String(format: "%.2f", er)) %\n"
        result += "-------------------------------\n"
        
        er = (abs((x - xo)/x)*100)
        counter += 1
        
        x2 = x1
        x1 = x
        if er > eps{
            secant(xo: x1, xMinus: x2, eps: eps, fun: fun)
        }
    }
    
    func secantWithIter(xo: Double,xMinus: Double, iter: Int, fun: String){
        var x1 = xo
        var x2 = xMinus
        x = x1 - ((f(x: x1, string: fun) * (x2 - xo))/(f(x: x2, string: fun) - f(x: x1, string: fun)))
        
        result += "iteration \(counter)\n"
        result += "X-1   = \(String(format: "%.3f", x2))\n"
        result += "ƒ(X-1)= \(String(format: "%.3f",f(x: x2, string: fun)))\n"
        result += "Xi    = \(String(format: "%.3f", x1))\n"
        result += "ƒ(Xi) = \(String(format: "%.3f",f(x: x1, string: fun)))\n"
        result += "er    = \(String(format: "%.2f", er)) %\n"
        result += "-------------------------------\n"
        
        er = (abs((x - xo)/x)*100)
        counter += 1
        
        x2 = x1
        x1 = x
        if iter >= counter{
            secantWithIter(xo: x1, xMinus: x2, iter: iter, fun: fun)
        }
    }
    
    
    
    func getResult() -> String{
        return result
    }
    func setReset(){
        result = ""
        counter = 0
    }
}

