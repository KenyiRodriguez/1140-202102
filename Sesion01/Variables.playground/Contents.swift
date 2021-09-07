import UIKit


//***************** TIPOS DE VARIABLES ******************
/*
 
    ========================
    VARIABLES MUTABLES (var)
    ========================
    - Es toda aquella variable que puede cambiar su valor a lo largo de todo su ciclo de vida. { }
    - Son variables que pueden cambiar su dirección de memoria
    
    var edad = 20
 
    ==========================
    VARIABLES INMUTABLES (let)
    ==========================
    - Es toda aquella variable que NO PUEDE cambiar su valor. Una vez asignado, este no cambia.
    - Se les asigna una dirección de memoria fija.
 
    let edad = 20
 
 */


var edad = 20
edad = 21
edad = 22

let precio = 30
//precio = 31 (esto da error, ya que no se puede alterar el dato de la variable)



//***************** TIPOS DE DECLARACIÓN ******************
/*
 
    =====================
    DECLARACIÓN IMPLÍCITA
    =====================
    - Swift infiere el tipo de dato de una variable en su declaración, según el dato asignado
    - Esto de puede dar para variables mutables e inmutables
    
    let edad = 20           -> Lo toma como si fuera un Int
    var edad = 20           -> Lo toma como si fuera un Int
 
    var precio = 20         -> Lo toma como si fuera un Int
    var precio = 20.0       -> Lo toma como si fuera un Double
 
    let nombre = "kenyi"    -> Lo tomo como String
 
    =====================
    DECLARACIÓN EXPLÍCITA
    =====================
    - Se debe definir un tipo de dato al momento de declarar una variable
    - Esto de puede dar para variables mutables e inmutables
 
    let edad: Int = 20
    var edad: Int = 20
    
    var precio: Double = 20
    var precio: Double = 20.0

    let nombre: Sring = "kenyi"
 */


var notaFinal: Double = 20
let examenParcial: Double = 10.5
let sumaNotas = notaFinal + examenParcial

let practica = 20
let final = 15.3
let total = Double(practica) + final


let nombre = "Kenyi"
let apellido = "Rodriguez"
let dni = 87654321

let datos1 = nombre + apellido
let datos2 = nombre + " " + apellido
let datos3 = nombre + " " + apellido + " " + String(dni)
let datos4 = "\(nombre) \(apellido) \(dni)"

let datos5 = "Nombre: \(nombre) Apellido: \(apellido) DNI: \(dni)"
print(datos5)

let datos6 = "Nombre: \(nombre)\nApellido: \(apellido)\nDNI: \(dni)"
print(datos6)

