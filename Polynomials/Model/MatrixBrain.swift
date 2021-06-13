//
//  MatrixBrain.swift
//  Polynomials
//
//  Created by Khater on 6/1/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import Foundation

class Matrix {
    var result: String = ""
    
    func check(a11: Double?, a12: Double?, a13: Double?, a14: Double?, a21: Double?, a22: Double?, a23: Double?, a24: Double?, a31: Double?, a32: Double?, a33: Double?, a34: Double?) -> Bool{
        if a11 != nil && a12 != nil && a13 != nil && a14 != nil && a21 != nil && a22 != nil && a23 != nil && a24 != nil && a31 != nil && a32 != nil && a33 != nil && a34 != nil{
            return true
        }else{
            return false
        }
    }
    
    func gauss(a11: Double, a12: Double, a13: Double, a14: Double, a21: Double, a22: Double, a23: Double, a24: Double, a31: Double, a32: Double, a33: Double, a34: Double){
        //Gauss elemenation
        var matrix: [[Double]] = [[a11,a12,a13,a14],[a21,a22,a23,a24],[a31,a32,a33,a34]]

        let m21 = matrix[1][0] / matrix [0][0]
        let m31 = matrix[2][0] / matrix [0][0]


        //E2 - (m21)E1 ->E2
        for i in 0..<matrix[1].count{
            matrix [1][i] = matrix [1][i] - (m21 * matrix[0][i])

        }

        //E3 - (m31)E1 ->E3
        for i in 0..<matrix[2].count{
            matrix [2][i] = matrix [2][i] - (m31 * matrix[0][i])
        }
        result += "Gauss Elemenation:  \n"
        
        result += "m₂₁ =   \(m21) \n"
        result += "m₃₁ =   \(m31) \n"
        result += "\n"
        for i in 0..<matrix.count{
            for j in 0..<matrix.count{
                result += "\(matrix[i][j])   "
            }
            result += "\n"
        }
        result += "\n"
        
        
        let m32 = matrix[2][1] / matrix [1][1]

        //E3 - (m32)E2 ->E3
        for i in 0..<matrix[2].count{
            matrix [2][i] = matrix [2][i] - (m32 * matrix[1][i])
        }
        result += "-------------------------------\n"
        result += "m₃₂ =   \(m32)\n"
        result += "\n"
        for i in 0..<matrix.count{
            for j in 0..<matrix.count{
                result += "\(matrix[i][j])   "
            }
            result += "\n"
        }
        result += "\n"
        
        result += "-------------------------------\n"
        result += "Gauss Elemenation:  \n"
        
        for i in 0..<matrix.count{
            for j in 0..<matrix.count{
                result += "\(matrix[i][j])   "
            }
            result += "\n"
        }
        result += "-------------------------------\n"
        
        let x3 = matrix[2][3]/matrix[2][2]
        let x2 = (matrix[1][3] + (-x3 * matrix[1][2])) / matrix[1][1]
        let temp0 = (matrix[0][3] + (-x2 * matrix[0][1]) + (-x3 * matrix[0][2]))
        let x1 = temp0 / matrix[0][0]
        
        result += "X₁ =   \(x1) \n"
        result += "X₂ =   \(x2) \n"
        result += "X₃ =   \(x3) \n"
        result += "-------------------------------\n"
        
    }
    
    
    func LU(a11: Double, a12: Double, a13: Double, a14: Double, a21: Double, a22: Double, a23: Double, a24: Double, a31: Double, a32: Double, a33: Double, a34: Double){
        //Gauss elemenation
        var matrix: [[Double]] = [[a11,a12,a13,a14],[a21,a22,a23,a24],[a31,a32,a33,a34]]

        let b: [Double] = [matrix[0][3],matrix[1][3],matrix[2][3]]

        let m21 = matrix[1][0] / matrix [0][0]
        let m31 = matrix[2][0] / matrix [0][0]


        //E2 - (m21)E1 ->E2
        for i in 0..<matrix[1].count{
            matrix [1][i] = matrix [1][i] - (m21 * matrix[0][i])

        }

        //E3 - (m31)E1 ->E3
        for i in 0..<matrix[2].count{
            matrix [2][i] = matrix [2][i] - (m31 * matrix[0][i])
        }

        let m32 = matrix[2][1] / matrix [1][1]

        //E3 - (m32)E2 ->E3
        for i in 0..<matrix[2].count{
            matrix [2][i] = matrix [2][i] - (m32 * matrix[1][i])
        }


        //LU Decomposition
        let U = matrix
        result += "U =\n"
        for i in 0..<U[0].count - 1{
            for j in 0..<U[0].count - 1{
                result += "\(U[i][j])   "
            }
            result += "\n"
        }
        
        result += "-------------------------------\n"
        
        let L:[[Double]] = [[1,0,0],[m21,1,0],[m31,m32,1]]
        result += "L =\n"
        for i in 0..<L[0].count{
            for j in 0..<L[0].count{
                result += "\(L[i][j])   "
            }
            result += "\n"
        }
        
        result += "-------------------------------\n"
        
        //Lc = b
        //c =
        let c1 = b[0]
        let c2 = (-(L[1][0] * c1) + b[1]) / L[1][1]
        let temp1 = -(L[2][0] * c1)
        let temp2 = -(L[2][1] * c2)
        let c3 = ( temp1 + temp2 + b[2]) / L[2][2]
        result += "C₁ = \(c1) , C₂ = \(c2) , C₃ = \(c3)\n"
        result += "-------------------------------\n"
        
        //Ux = c
        //X =
        let X3 = c3 / U[2][2]
        let X2 = (-(X3 * U[1][2]) + c2) / U[1][1]
        let temp3 = -(U[0][1] * X2) + (-(U[0][2] * X3)) + c1
        let X1 = temp3 / U[0][0]
        result += "X₁ = \(X1) , X₂ = \(X2) , X₃ = \(X3)"
    }
    
    func cramer(a11: Double, a12: Double, a13: Double, a14: Double, a21: Double, a22: Double, a23: Double, a24: Double, a31: Double, a32: Double, a33: Double, a34: Double){

        let matrix: [[Double]] = [[a11,a12,a13,a14],[a21,a22,a23,a24],[a31,a32,a33,a34]]
        var tempMatrix = matrix
        
        result += "A = \n"

        for i in 0..<tempMatrix.count{
            for j in 0..<tempMatrix.count{
                result += "     \(tempMatrix[i][j]) "
            }
            result += "\n"
        }
        result += "-------------------------------\n"
        
        var a = matrix[0][0] * ((matrix[1][1] * matrix[2][2]) - (matrix[1][2] * matrix[2][1]))
        var b = matrix[0][1] * ((matrix[1][0] * matrix[2][2]) - (matrix[1][2] * matrix[2][0]))
        var c = matrix[0][2] * ((matrix[1][0] * matrix[2][1]) - (matrix[1][1] * matrix[2][0]))

        let A = a - b + c
        result += "A = \(A)\n"
        result += "-------------------------------\n"
        
        for i in 0..<matrix.count{
            tempMatrix[i][0] = matrix[i][3]
        }
        
        result += "A1 = \n"

        for i in 0..<tempMatrix.count{
            for j in 0..<tempMatrix.count{
                result += "     \(tempMatrix[i][j]) "
            }
            result += "\n"
        }
        result += "-------------------------------\n"
        
        a = tempMatrix[0][0] * ((tempMatrix[1][1] * tempMatrix[2][2]) - (tempMatrix[1][2] * tempMatrix[2][1]))
        b = tempMatrix[0][1] * ((tempMatrix[1][0] * tempMatrix[2][2]) - (tempMatrix[1][2] * tempMatrix[2][0]))
        c = tempMatrix[0][2] * ((tempMatrix[1][0] * tempMatrix[2][1]) - (tempMatrix[1][1] * tempMatrix[2][0]))
        
        let A1 = a - b + c
        result += "A1 = \(A1)\n"
        result += "-------------------------------\n"
        
        tempMatrix = matrix
        for i in 0..<matrix.count{
            tempMatrix[i][1] = matrix[i][3]
        }
        
        result += "A2 = \n"

        for i in 0..<tempMatrix.count{
            for j in 0..<tempMatrix.count{
                result += "     \(tempMatrix[i][j]) "
            }
            result += "\n"
        }
        result += "-------------------------------\n"

        a = tempMatrix[0][0] * ((tempMatrix[1][1] * tempMatrix[2][2]) - (tempMatrix[1][2] * tempMatrix[2][1]))
        b = tempMatrix[0][1] * ((tempMatrix[1][0] * tempMatrix[2][2]) - (tempMatrix[1][2] * tempMatrix[2][0]))
        c = tempMatrix[0][2] * ((tempMatrix[1][0] * tempMatrix[2][1]) - (tempMatrix[1][1] * tempMatrix[2][0]))
        
        let A2 = a - b + c
        result += "A2 = \(A2)\n"
        result += "-------------------------------\n"
        
        tempMatrix = matrix
        for i in 0..<matrix.count{
            tempMatrix[i][2] = matrix[i][3]
        }
        
        result += "A3 = \n"

        for i in 0..<tempMatrix.count{
            for j in 0..<tempMatrix.count{
                result += "     \(tempMatrix[i][j]) "
            }
            result += "\n"
        }
        result += "-------------------------------\n"
        
        a = tempMatrix[0][0] * ((tempMatrix[1][1] * tempMatrix[2][2]) - (tempMatrix[1][2] * tempMatrix[2][1]))
        b = tempMatrix[0][1] * ((tempMatrix[1][0] * tempMatrix[2][2]) - (tempMatrix[1][2] * tempMatrix[2][0]))
        c = tempMatrix[0][2] * ((tempMatrix[1][0] * tempMatrix[2][1]) - (tempMatrix[1][1] * tempMatrix[2][0]))
        
        let A3 = a - b + c
        result += "A3 = \(A3)\n"
        result += "-------------------------------\n"
        
        let X1 = A1/A
        let X2 = A2/A
        let X3 = A3/A
        
        result += "X1 = \(X1)\n"
        result += "X2 = \(X2)\n"
        result += "X3 = \(X3)\n"
    }
    
    func getResult() -> String {
        return result
    }
    func setReset(){
        result = ""
    }
    
}
