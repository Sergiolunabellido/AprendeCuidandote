import 'package:aprendecuidandote/screens/contactos/contactos.dart';
import 'package:aprendecuidandote/core/colores.dart';
import 'package:flutter/material.dart';

class Opciones extends StatelessWidget {
  final Image image;
  final String text;
  final Color color;

  const Opciones({
    super.key,
    required this.image,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          image,
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 35.0,
              fontFamily: 'Times New Roman',
              color: Colores.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      // Assuming 'image' is a valid image path or URL
      // If it's a local asset, you might need to use Image.asset(image) instead
    );
  }
}

class OpcionesPrincipal extends StatefulWidget {
  const OpcionesPrincipal({super.key});

  @override
  State<OpcionesPrincipal> createState() => _OpcionesPrincipalState();
}

class _OpcionesPrincipalState extends State<OpcionesPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                print('boton tocado'); // Acción al pulsar el botón
              },
              child: Opciones(
                image: Image.asset(
                  'assets/images/kit-de-primeros-auxilios.png',
                  width: 200,
                  height: 200,
                ),
                text: 'Urgencias',
                color: Colores.emergenciColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                print('boton tocado'); // Acción al pulsar el botón
              },
              child: Opciones(
                image: Image.asset(
                  'assets/images/juego-de-mesa.png',
                  width: 200,
                  height: 200,
                ),
                text: 'Juegos',
                color: Colores.gamesColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Contactos()),
                ); // Acción al pulsar el botón
              },
              child: Opciones(
                image: Image.asset(
                  'assets/images/contacto.png',
                  width: 200,
                  height: 200,
                ),
                text: 'Contactos',
                color: Colores.contactColor,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 1000,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Mantente conectado y bien cuidado',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Times New Roman',
                color: Colores.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                print('boton tocado'); // Acción al pulsar el botón
              },
              child: Opciones(
                image: Image.asset(
                  'assets/images/dieta.png',
                  width: 200,
                  height: 200,
                ),
                text: 'Dieta',
                color: Colores.dietColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                print('boton tocado'); // Acción al pulsar el botón
              },
              child: Opciones(
                image: Image.asset(
                  'assets/images/equipo-medico.png',
                  width: 200,
                  height: 200,
                ),
                text: 'Medico',
                color: Colores.doctorColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                print('boton tocado'); // Acción al pulsar el botón
              },
              child: Opciones(
                image: Image.asset(
                  'assets/images/anticonceptivo-oral.png',
                  width: 200,
                  height: 200,
                ),
                text: 'Pastillas',
                color: Colores.medicinasColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
