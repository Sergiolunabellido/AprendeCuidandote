import 'package:aprendecuidandote/core/colores.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Contactos extends StatefulWidget {
  const Contactos({super.key});

  @override
  State<Contactos> createState() => _ContactosState();
}

class _ContactosState extends State<Contactos> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController fotoController = TextEditingController();

  Future<Database> openDB() async {
    final databasePath = join(await getDatabasesPath(), 'contactos.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute('''CREATE TABLE CONTACTOS(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            telefono TEXT NOT NULL,
            imagen TEXT NOT NULL)''');
      },
    );
  }

  Future<void> insertarContacto(
    String nombre,
    String telefono,
    String imagen,
  ) async {
    final db = await openDB();
    await db.insert('contactos', {
      'nombre': nombre,
      'telefono': telefono,
      'imagen': imagen,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> obtenerContactos() async {
    final db = await openDB();
    return await db.query(" select: ['nombre'] from contactos");
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lista de Contactos",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
            // Aquí puedes agregar más widgets para mostrar los contactos
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Introduce los datos del contacto"),
                      titleTextStyle: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: nombreController,
                            decoration: InputDecoration(hintText: "Nombre"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                          TextField(
                            controller: telefonoController,
                            decoration: InputDecoration(hintText: "Teléfono"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                          TextField(
                            controller: fotoController,
                            decoration: InputDecoration(hintText: "Email"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              String nombre = nombreController.text;
                              String telefono = telefonoController.text;
                              String foto = fotoController.text;

                              await insertarContacto(nombre, telefono, foto);
                              print(
                                "Usuario guardado: $nombre, $telefono, $foto",
                              );

                              setState(() {});
                              // Acción para guardar el contacto
                              Navigator.of(context).pop();
                            },
                            child: Text("Guardar"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print(obtenerContactos());
                            },
                            child: Text("Contactos"),
                          ),
                        ],
                      ),
                    );
                  },
                );
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
