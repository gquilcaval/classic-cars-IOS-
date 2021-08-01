//
//  FavoritosViewController.swift
//  ClassicCarsR
//
//  Created by AnthonyDeca on 18/11/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import UIKit

class FavoritosViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, DataCollectionProtocol{
   
    

  
    
    @IBOutlet weak var tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabla.dataSource = self
        self.tabla.delegate = self
            
        modelo = mangerDB.Listar()
        self.tabla.reloadData()
        
        self.tabla.refreshControl = UIRefreshControl()
        self.tabla.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        
    }
    
    @objc private func didPullToRefresh(){
        print("start refresh")
        modelo = mangerDB.Listar()
        self.tabla.reloadData()
        self.tabla.refreshControl?.endRefreshing()
    }
    
    func passData(cod: Int32, nom: String, precio: Int32, cantidad: Int32,foto: String) {
        
       print("")

    }
    
    func eliminar(cod: Int) {
        
        
        
    }
    func actualizarCantidad(cod: Int32, cantidad: Int32) {
        
        mangerDB.actualizarFavoritos(cod: cod, cantidad: cantidad)
    }
   
    
   
    
    @IBAction func Pedir(_ sender: Any) {

        var detalle: [[String: Any]]? = [[:]]
        var pr: Producto?
        var par: [String: Any] = [:]
        
        for p in modelo {
           
            pr = Producto(idprod: p.id, cantxUnidad: p.cantidad, precioUnidad: Double(p.precio))
            par = [
                "idprod": pr?.idprod,
                "cantxUnidad": pr?.cantxUnidad,
                "precioUnidad": pr?.precioUnidad
                  ]
            detalle!.append(par)
        
           
        }
        detalle?.removeFirst()
        
        
        //var pedido = Pedido(fecha: "2016-03-03", idUser: 2, detail: lista)
        let Url = String(format: "http://192.168.18.4:8080/proyecto-sw/tipopost/sale/insert")
            guard let serviceUrl = URL(string: Url) else { return }
        let date = Date()
        let formatter = DateFormatter()
      
        formatter.dateFormat = "yyyy-MM-dd"

            let parameters: [String: Any] =
                 [
                    "fechVen": formatter.string(from: date),
                    "idUser": 1,
                    "detail": detalle
                ]
            
            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                return
            }
            request.httpBody = httpBody
            request.timeoutInterval = 20
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print("esta es la respuesta")
                    print(response)
                    print(detalle!.description)
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    
    
    
  
   
    let mangerDB = CoreDataManager()
    var modelo : [Favorito] = []
    
    
    struct CustomData {
        var image: UIImage
    }
    
  
    
    
    
    
  
    
    
    
    
   
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndex = indexPath.item
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCarrito", for: indexPath) as! ProductoViewCell
        
        cell.layer.cornerRadius = 20
       
        
        let url =  modelo[cellIndex].foto
        let urlPhoto1 = url
        
        
        
        if let objURL = URL(string: urlPhoto1!){
            
            if let datos = try? Data(contentsOf: objURL){
                if let imagen = UIImage(data: datos) {
                   cell.Imagen.image = imagen
                }else {
                    //error
                }
            }else{
                //error
            }
        }
     
        cell.Nombre.text = modelo[cellIndex].nombre
        cell.Precio.text = "S./" + (String)(modelo[cellIndex].precio)
        
        cell.delegate = self
        cell.cod = modelo[cellIndex].id
        cell.nom = modelo[cellIndex].nombre
        cell.pre = modelo[cellIndex].precio
        cell.cant = modelo[cellIndex].cantidad
        cell.foto = modelo[cellIndex].foto
       
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let producto = modelo[indexPath.row]
        modelo.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        mangerDB.eliminarFavorito(id: Int(producto.id))
    }
    

   
    

}


extension UIImageView{
    
    func loadFoto(url: String)  {
        
        if let objtRul=URL(string: url){
        
            DispatchQueue.global().async {
                
        
                if let datos = try? Data(contentsOf: objtRul){
                    
                    if let imagen=UIImage(data: datos){
                        
                        DispatchQueue.main.async {
                             self.image=imagen
                        }
                       
                    }
                }
                else{
                     
                }
            }
            
        }    }
}


