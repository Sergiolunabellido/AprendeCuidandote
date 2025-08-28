import 'package:aprendecuidandote/core/colores.dart';
import 'package:aprendecuidandote/screens/contactos/funcionesContactos.dart';
import 'package:flutter/material.dart';

class Contactos extends StatelessWidget {
  const Contactos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos"),
        titleSpacing: 20.0,
        titleTextStyle: TextStyle(
          fontSize: 20.0,
          color: Colores.textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Times New Roman',
        ),
        backgroundColor: Colors.grey,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Accion para el boton de settings
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Lista de Contactos",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
            // Aquí puedes agregar más widgets para mostrar los contactos
            GestureDetector(
              onTap: () {
                listaOpcionesContactos;
                print("Añadir Contacto");
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 4),
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey,
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/mas.png', width: 70, height: 70),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
