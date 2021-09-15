import UIKit

//***************** VARIABLES OPCIONALES ****************
/*
 
    * Son propensas al fallo
    * Pueden guardar un dato o un nulo
    * No almacenan directamente el dato, lo que guardan es una dirección de memoria al dato
    * Son variables especiales
    * NO PUEDEN SER TRATADAS COMO UNA VARIABLE NORMAL
 
 */

let nombre: String? = "Kenyi"
let apellido: String = "Rodriguez"

// Operador unwrap
/*
    SÓLO SE PUEDE APLICAR A UNA VARIABLE OPCIONAL
    Esta definido por los siguientes símb1olos (??)
    Sirve para desempaquetar el dato de una variable opcional
    En caso en el proceso se encuentre un nulo (nil) este operador te permite setear un valor por defecto.
 
 */

let valorDefecto = "Nombre no definido"
let nombreSeguro = nombre ?? valorDefecto

let datos = (nombre ?? valorDefecto) + " " + apellido
let datos2 = "Nombre: \(nombre ?? valorDefecto) \nApellido: \(apellido)"
print(datos2)


func sumarNumero1(_ n1: Int?, conNumero2 n2: Int?) -> Int {
    
    let n1 = n1 ?? 0
    let n2 = n2 ?? 0
    return n1 + n2
}

let txtNumero1 = UITextField()
let txtNumero2 = UITextField()
txtNumero1.text = "9"

let numero1 = Int(txtNumero1.text ?? "")
let numero2 = Int(txtNumero2.text ?? "")

print(sumarNumero1(numero1, conNumero2: numero2))


//********* Guard var / let *************
/*
    sirve para crear una variable segura. Es decir, una variable distinta de nil
    Maneja errores y corta el flujo en caso encuentre uno
 */

print("\n**************************\n")

func sumarGuardNumero1(_ n1: Int?, conNumero2 n2: Int?) -> Int? {
    
    guard let n1Seguro = n1 else {
        //Puedes poner más código
        print("El número 1 es incorrecto")
        return nil
    }

    guard let n2Seguro = n2 else {
        print("El número 2 es incorrecto")
        return nil
    }
    
    return n1Seguro + n2Seguro
}

let resultadoGuard = sumarGuardNumero1(nil, conNumero2: 12)
print(resultadoGuard ?? "Ocurrio un error en la operación...")


func registrarUsuarioConNombre(_ nombre: String?, apellido: String?, nacionalidad: String?) {
    
    guard let nombreSeguro = nombre else {
        print("El nombre es incorrecto")
        return
    }
    
    guard let apellidoSeguro = apellido else {
        print("El apellido es incorrecto")
        return
    }
    
    let nacionalidadSegura = nacionalidad ?? ""
    let datos = "Nombre: \(nombreSeguro) \nApellido: \(apellidoSeguro) \nNacionalidad: \(nacionalidadSegura)"
    print(datos)
}

print("\n**************************\n")
registrarUsuarioConNombre("Kenyi", apellido: "Rodriguez", nacionalidad: nil)
