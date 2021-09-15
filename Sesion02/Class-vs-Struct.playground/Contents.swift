import UIKit

class Persona {
    
}

class AlumnoClass: Persona {

    var nombre: String
    let apellido: String

    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
}

struct AlumnoStruct {
    
    var nombre: String
    let apellido: String
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
}

var objAlumnoStruct = AlumnoStruct(nombre: "Kenyi", apellido: "Rodriguez")
var objAlumnoclass = AlumnoClass(nombre: "Kenyi", apellido: "Rodriguez")


let objAlumnoClassAux = objAlumnoclass
objAlumnoclass.nombre = "Juan"

print(objAlumnoclass.nombre)
print(objAlumnoClassAux.nombre)



let objAlumnoStructAux = objAlumnoStruct
objAlumnoStruct.nombre = "Juan"

print(objAlumnoStruct.nombre)
print(objAlumnoStructAux.nombre)

