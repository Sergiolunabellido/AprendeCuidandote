import 'package:flutter/material.dart';

class funcionesContactos {
  // Aquí puedes definir las funciones relacionadas con los contactos
  // Por ejemplo, para añadir, borrar o actualizar contactos en la base de datos
  void anadirContacto() {
    //Aqui añadiremos un contacto nuevo en la base de datos.
  }

  void borrarContacto() {
    //Aqui eliminamos un contacto de la base de datos.
  }

  void actualizarContacto() {
    //Aqui podemos modificar los datos de un contacto en la base de datos.
  }
}

class listaOpcionesContactos extends StatefulWidget {
  const listaOpcionesContactos({super.key});

  @override
  State<listaOpcionesContactos> createState() => _listaOpcionesContactosState();
}

class _listaOpcionesContactosState extends State<listaOpcionesContactos> {
  String? selectedOption;
  List<String> options = [
    'Añadir Contacto',
    'Eliminar Contacto',
    'Modificar Contacto',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField(
        value: selectedOption,
        items: options
            .map(
              (option) => DropdownMenuItem(value: option, child: Text(option)),
            )
            .toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue;
          });
        },
      ),
    );
  }
}
