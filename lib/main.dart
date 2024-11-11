import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Oriol Abad Pràtica 3',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oriol Abad Pràtica 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text(myController.text.isEmpty
                ? 'No hi ha text introduït!'
                : 'Valor introduït: ${myController.text}'),
            action: SnackBarAction(
              label: 'Tancar',
              onPressed: () {
                // Acción para cerrar el SnackBar
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          );

          // Muestra el SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        tooltip: 'Mostra el valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}