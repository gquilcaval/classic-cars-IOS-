//
//  Pedido.swift
//  ClassicCarsR
//
//  Created by Jonathan Quilla valenzuela on 12/8/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import Foundation

class Pedido {
    
        let fecha: String
        let idUser:Int32
        let detail: [Producto]
       
    init(fecha: String, idUser: Int32, detail: [Producto]) {
        self.fecha = fecha
        self.idUser = idUser
        self.detail = detail
        
}
}
