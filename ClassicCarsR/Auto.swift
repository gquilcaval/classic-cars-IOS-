//
//  Auto.swift
//  ClassicCarsR
//
//  Created by Jonathan Quilla valenzuela on 11/22/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import Foundation

class Auto {
    let codigo: Int32
    let modelo:String
    let precio: Double
    let img : String
    let cantidad : Int
    init(cod: Int32, modelo: String, precio: Double, img: String, cantidad: Int) {
        self.codigo = cod
        self.modelo = modelo
        self.precio = precio
        self.img = img
        self.cantidad = cantidad
    }
    
   
}
