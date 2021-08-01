//
//  ViewControllerLista.swift
//  ClassicCarsR
//
//  Created by AnthonyDeca on 1/11/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import UIKit
import SkeletonView

class ViewControllerLista: UIViewController, DataCollectionProtocol, UITableViewDataSource{
   
    
   
    
    @IBOutlet weak var tabla: UITableView!
    
    
    func actualizarCantidad(cod: Int32, cantidad: Int32) {
        print("no hace nada")
        
    }
    
   
    
    func eliminar(cod: Int) {
     
       
    }
    
    
    func passData(cod: Int32,nom: String, precio: Int32,cantidad: Int32, foto: String) {
        
        mangerDB.guardarFavoritos(cod: cod, nombre: nom, precio: precio, cantidad: 1 ,foto: foto)
       
    }
    
  
    
    
    let mangerDB = CoreDataManager()
    let colaTareas = DispatchQueue(label: "tarea_pasada", attributes: .concurrent)


    
    
    @IBAction func sgcMarca(_ sender: UISegmentedControl) {
        modelo.removeAll()
        print(sender.selectedSegmentIndex+1)
        DATA(marca:  sender.titleForSegment(at: sender.selectedSegmentIndex)!)
    }
    
    
   
    struct CustomData {
        var image: UIImage
    }
    
    
    var colectionArr : [String] = ["1","2","3","4"]
    var modelo : [Auto] = []
    var img : [String] = []
    var n=0
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
        self.tabla.dataSource = self
        
        self.DATA(marca: "Dodge")
      
    }
    
  
    
    func DATA(marca: String) {
        
        
        let urlAutos = URL (string: "https://companycars.herokuapp.com/api/carro/"+marca)
      
        if modelo.count == 0 {
          
            URLSession.shared.dataTask(with: urlAutos!){ [self] (data,response,error) in
            if error == nil{
                
                do{
                    
                   
               
                    if  let json = try?  JSONSerialization.jsonObject(with: data!, options: []){
                                                  
                        let jsonObject = json as! [String: Any]
                        let resultados = jsonObject["result"] as! [[String:Any]]
                                         
                                                  
                        for unjson in resultados {
                            let auto = Auto(cod: unjson["id"] as! Int32, modelo:  unjson["modelo"] as! String , precio: unjson["precio"] as! Double , img: unjson["foto"] as! String, cantidad: 0)
                            self.modelo.append(auto)
                            print( auto.modelo)
                            }
                                            
                        }
                        
                                            
                    }
                    catch {
                    print(error)
                       
                }
                DispatchQueue.main.async {
                    
                    self.tabla.reloadData()
                }
            }
            
        }.resume()
           
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndex = indexPath.item
        let viewcell = tableView.dequeueReusableCell(withIdentifier: "cellProducto", for: indexPath) as! ProductoViewCell
      
       
        
        let urlPhoto1 = modelo[cellIndex].img
        
        
        
        if let objURL = URL(string: urlPhoto1){
            
            if let datos = try? Data(contentsOf: objURL){
                if let imagen = UIImage(data: datos) {
                   viewcell.Imagen.image = imagen
                }else {
                    //error
                }
            }else{
                //error 
            }
        }
        
      
     
        //ESTO ES PARA EL PASS DATA
        viewcell.cod = modelo[cellIndex].codigo
        viewcell.nom = modelo[cellIndex].modelo
        viewcell.pre = Int32(modelo[cellIndex].precio)
        viewcell.cant = Int32(modelo[cellIndex].cantidad)
        viewcell.foto = modelo[cellIndex].img
        viewcell.delegate = self
        viewcell.index = indexPath
        
      
        //ESTO ES EN LA VISTA
        viewcell.Nombre.text = (String) (modelo[cellIndex].modelo)
        //viewcell.Precio.text = "S./" + String(modelo[cellIndex].precio)
        
        return viewcell
    }
        
    
 
    

 
    

    
}


