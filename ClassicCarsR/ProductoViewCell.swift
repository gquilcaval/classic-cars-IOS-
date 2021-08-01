//
//  CollectionViewCell.swift
//  ClassicCarsR
//
//  Created by AnthonyDeca on 1/11/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import UIKit
import CoreData
import SkeletonView
protocol DataCollectionProtocol {
    func  passData(cod: Int32 ,nom: String ,precio :Int32,cantidad: Int32, foto: String)
    func eliminar (cod : Int)
    func actualizarCantidad (cod : Int32, cantidad: Int32)
   
   
}

class ProductoViewCell: UITableViewCell {
    
  
   
   
    @IBOutlet weak var lblCantidad: UILabel!
    
    

    override  func  awakeFromNib(){
        super.awakeFromNib()
        
    }
  
    
    
    
    @IBOutlet weak var Imagen: UIImageView!
    @IBOutlet weak var Nombre: UILabel!
    @IBOutlet weak var Precio: UILabel!
    
    @IBAction func VerDetalle(_ sender: Any) {
        DetalleVC.nombre = self.nom!
        DetalleVC.precio = (String)(self.pre!)
        DetalleVC.foto = self.foto
    }
     
    @IBAction func agregarCarrito(_ sender: Any) {
        
        delegate?.passData(cod: cod!, nom: nom!, precio: pre!, cantidad: 1, foto: foto!)
        
       
        
        
    }
    
    
    var delegate : DataCollectionProtocol?
    
    var cod: Int32?
    var nom: String?
    var pre: Int32?
    var foto: String?
    var cant: Int32?
    var tabla: UITableView?
    var lista: [Favorito]?
    var index: IndexPath?
  
    private func setupSkeleton(){
        
        
        Imagen.showAnimatedGradientSkeleton()
    }
    
    @IBAction func EliminarFavorito(_ sender: Any) {
      
       
        delegate?.eliminar(cod: Int(cod!))
   
       
    }
    @IBAction func stpCantidad(_ sender: UIStepper) {
        lblCantidad.text = (String)(Int(cant!) + Int(sender.value))
        delegate?.actualizarCantidad(cod: cod!, cantidad: Int32(lblCantidad.text!)!)
    }
    
   
    
    
    @IBOutlet weak var btnComprar: UIButton!
}
