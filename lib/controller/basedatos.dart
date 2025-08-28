import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
  });
}
