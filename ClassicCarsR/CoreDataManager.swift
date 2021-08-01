//
//  CoreDataManager.swift
//  ClassicCarsR
//
//  Created by Jonathan Quilla valenzuela on 11/28/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager{

    private let container : NSPersistentContainer!
    
    init() {
        container = NSPersistentContainer(name: "ClassicBD")
        container.loadPersistentStores { (stDes, err) in
            if let err=err{
                print("error en la bd \(stDes) - \(err)")
            }else{
                print("todo ok")
            }
        }
    }
    
    func guardarFavoritos( cod: Int32, nombre: String, precio: Int32, cantidad: Int32,foto: String){
        
        
        let context = container.viewContext
        
        let query :NSFetchRequest<Favorito> = Favorito.fetchRequest()
        query.predicate = NSPredicate(format: "id = %d", cod)
        
        do {
            let lista = try context.fetch(query)
            
            if lista.count == 1 {
                lista[0].setValue(nombre, forKey: "nombre")
                lista[0].setValue(precio, forKey: "precio")
                lista[0].setValue(lista[0].value(forKey: "cantidad") as! Int + 1, forKey: "cantidad")
                lista[0].setValue(foto, forKey: "foto")
                
                try context.save()
                print("se actualizo correctamente")
                
            }
            else{
                let favoritos = Favorito(context: context)
                
                favoritos.id = cod
                favoritos.nombre = nombre
                favoritos.precio = precio
                favoritos.foto = foto
                favoritos.cantidad = cantidad
                
                do{
                      try  context.save()
                        print("se guardo")
                }catch{
                    print("no se pudo guardar \(error)")
                }
            }
        } catch  {
            print("error metodo actualizar")
        }
        
        
        
        
        
        
        
    }
    
    
    func actualizarFavoritos( cod: Int32, cantidad: Int32){
      
        
        let context = container.viewContext
        
        let query :NSFetchRequest<Favorito> = Favorito.fetchRequest()
        query.predicate = NSPredicate(format: "id = %d", cod)
        
        do {
            let lista = try context.fetch(query)
            if lista.count == 1 {
               
             
                lista[0].setValue(cantidad, forKey: "cantidad")
              
                
                try context.save()
                print("se actualizo correctamente")
                
            }
            else{
                print("no se encontraron registros")
            }
        } catch  {
            print("error metodo actualizar")
        }
    }
  
    
    
    func Listar() -> [Favorito]{
        
      
        
        
        let context = container.viewContext
        let query : NSFetchRequest<Favorito> = Favorito.fetchRequest()
        //query.predicate = NSPredicate(format: "codigo = %d", 10)
        
        do{
            let lista = try context.fetch(query)
            return lista
        }
        catch{
            print("error al lista")
        }
        return []
    }
    
    func eliminarFavorito(id : Int){
        let context = container.viewContext
        let query : NSFetchRequest<Favorito> = Favorito.fetchRequest()
        query.predicate =  NSPredicate(format: "id = %d", id)
        //query.predicate = NSPredicate(format: "codigo = %d", 10)
        
        do{
            let lista = try context.fetch(query)
            if lista.count == 1 {
                
                context.delete(lista[0])
                try context.save()
                print("eliminado")
            }
            
        }
        catch{
            print("error al elimianar")
        }
      
    }
    
}
