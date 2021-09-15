import UIKit

class Alumno {
    
    let nombre: String
    let apellido: String
    var direccion: String = ""
    
    var nombreCompleto: String {
        return "\(self.nombre) \(self.apellido)"
    }
    
    var iniciales: String {
        
        let primeraInicial = self.nombre.prefix(1).uppercased()
        let segundaInicial = self.apellido.prefix(1).uppercased()
        
        let iniciales = primeraInicial + segundaInicial
        return iniciales
    }
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
}

let objAlumno = Alumno(nombre: "Kenyi", apellido: "Rodriguez")

print(objAlumno.nombreCompleto)
print(objAlumno.iniciales)


/*
 internal
 public
 private
 fileprivate
 open
 final
 */
