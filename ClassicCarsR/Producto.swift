//
//  Producto.swift
//  ClassicCarsR
//
//  Created by Jonathan Quilla valenzuela on 12/8/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import Foundation

class Producto{
    
    let idprod: Int32
    let cantxUnidad: Int32
    let precioUnidad: Double
    
    init(idprod: Int32, cantxUnidad: Int32, precioUnidad: Double) {
        self.idprod = idprod
        self.cantxUnidad = cantxUnidad
        self.precioUnidad = precioUnidad
    }
}
