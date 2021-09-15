import UIKit

protocol Persona {
    var nombre: String { get set }
    var apellido: String { get set }
    var dni: String { get set }
}

protocol Empleado {
    var codEmpleado: String { get set }
}

protocol Docente {
    var especialidad: String { get set }
}

class Alumno: Persona {
    var nombre: String = ""
    var apellido: String = ""
    var dni: String = ""

}

class Profesor: Persona, Empleado, Docente {
    var nombre: String = ""
    var apellido: String = ""
    var dni: String = ""
    var codEmpleado: String = ""
    var especialidad: String = ""
}

class Auxiliar: Persona, Empleado, Docente {
    var nombre: String = ""
    var apellido: String = ""
    var dni: String = ""
    var codEmpleado: String = ""
    var especialidad: String = ""
}

class Director: Persona, Empleado {
    var nombre: String = ""
    var apellido: String = ""
    var dni: String = ""
    var codEmpleado: String = ""
}

class PersonalLimpieza: Persona, Empleado {
    
    var nombre: String = ""
    var apellido: String = ""
    var dni: String = ""
    var codEmpleado: String = ""
}

var arrayEmpleados: [Docente] = [Auxiliar(), Profesor()]


class DetalleUsuario {
    
    private let persona: Persona
    
    init(persona: Persona) {
        self.persona = persona
    }
    
    func mostrarInformacion() {
        let datos = self.persona.nombre + " " + self.persona.apellido
        print(datos)
    }
}


let objAlumno = Alumno()
objAlumno.nombre = "Victor"
objAlumno.apellido = "Quispe"

let objProfesor = Profesor()
objProfesor.nombre = "Kenyi"
objProfesor.apellido = "Rodriguez"


let objLimpieza = PersonalLimpieza()
objLimpieza.nombre = "Juanito"
objLimpieza.apellido = "Salas"

let detalle = DetalleUsuario(persona: objLimpieza)
detalle.mostrarInformacion()


/*
 
 Single responsability
 Open close
 Liskov sustitution
 Interface segregation
 Dependency inversion
 
 */
