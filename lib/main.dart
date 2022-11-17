import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cambio Divisas',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Calculadora de divisas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final txt_i = TextEditingController();
final txt_f = TextEditingController();
String op1 = "COP";
String op2 = "USD";

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

List<DropdownMenuItem<String>> monedas = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "AUS", child: Text("AUS")),
  DropdownMenuItem(value: "CAD", child: Text("CAD")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "USD", child: Text("USD")),
];

List<calculadora> calcu = <calculadora>[
  calculadora("1", Colors.yellow, Icon(Icons.abc)),
  calculadora("2", Colors.yellow, Icon(Icons.abc)),
  calculadora("3", Colors.yellow, Icon(Icons.abc)),
  calculadora("4", Colors.yellow, Icon(Icons.abc)),
  calculadora("5", Colors.yellow, Icon(Icons.abc)),
  calculadora("6", Colors.yellow, Icon(Icons.abc)),
  calculadora("7", Color.fromARGB(255, 27, 85, 186), Icon(Icons.abc)),
  calculadora("8", Color.fromARGB(255, 27, 85, 186), Icon(Icons.abc)),
  calculadora("9", Color.fromARGB(255, 27, 85, 186), Icon(Icons.abc)),
  calculadora(
      "Borrar", Colors.red, Icon(Icons.keyboard_double_arrow_left_outlined)),
  calculadora("0", Colors.red, Icon(Icons.abc)),
  calculadora("Calcular", Colors.red, Icon(Icons.calculate)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Divisa inicial :"),
                  DropdownButton(
                      value: op1,
                      items: monedas,
                      onChanged: (String? m_i) {
                        setState(() {
                          op1 = m_i.toString();
                        });
                      }),
                  VerticalDivider(),
                  VerticalDivider(),
                  VerticalDivider(),
                  VerticalDivider(),
                  VerticalDivider(),
                  VerticalDivider(),
                  Text(" Divisa final :"),
                  DropdownButton(
                      value: op2,
                      items: monedas,
                      onChanged: (String? m_f) {
                        setState(() {
                          op2 = m_f.toString();
                        });
                      })
                ],
              ),
              TextField(
                controller: txt_i,
                decoration: InputDecoration(labelText: op1, hintText: "0"),
              ),
              TextField(
                controller: txt_f,
                decoration: InputDecoration(labelText: op2, hintText: "0"),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: calcu.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: calcu[index].color,
                      child: ListTile(
                        onTap: () {
                          if (index != 9 && index != 11) {
                            txt_i.text = txt_i.text + calcu[index].titulo;
                          } else if (index == 9) {
                            final pos = txt_i.text.length - 1;
                            txt_i.text = txt_i.text.substring(0, pos);
                            print(txt_i.text);
                            print(txt_i.text.length);
                          } else {
                            if (op1 == "COP" && op2 == "USD") {
                              txt_f.text =
                                  (double.parse(txt_i.text) / 5000).toString();
                            } else if (op1 == "COP" && op2 == "CAD") {
                              txt_f.text =
                                  (double.parse(txt_i.text) / 3335).toString();
                            } else if (op1 == "COP" && op2 == "AUS") {
                              txt_f.text =
                                  (double.parse(txt_i.text) / 3745).toString();
                            } else if (op1 == "COP" && op2 == "EUR") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 5174).toString();
                            } else if (op1 == "USD" && op2 == "COP") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 5000).toString();
                            } else if (op1 == "AUS" && op2 == "COP") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 3335).toString();
                            } else if (op1 == "CAD" && op2 == "COP") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 3745).toString();
                            } else if (op1 == "EUR" && op2 == "COP") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 5174).toString();
                            } else if (op1 == "EUR" && op2 == "AUS") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 1.55).toString();
                            } else if (op1 == "EUR" && op2 == "USD") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 1.04).toString();
                            } else if (op1 == "EUR" && op2 == "CAD") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 1.38).toString();
                            } else if (op1 == "AUS" && op2 == "EUR") {
                              txt_f.text =
                                  (double.parse(txt_i.text) / 1.55).toString();
                            } else if (op1 == "CAD" && op2 == "EUR") {
                              txt_f.text =
                                  (double.parse(txt_i.text) / 1.38).toString();
                            } else if (op1 == "USD" && op2 == "EUR") {
                              txt_f.text =
                                  (double.parse(txt_i.text) / 1.04).toString();
                            } else if (op1 == "AUS" && op2 == "USD") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 0.67).toString();
                            } else if (op1 == "AUS" && op2 == "CAD") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 0.89).toString();
                            } else if (op1 == "USD" && op2 == "AUS") {
                              txt_f.text =
                                  (double.parse(txt_i.text) / 0.67).toString();
                            } else if (op1 == "CAD" && op2 == "AUS") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 1.12).toString();
                            } else if (op1 == "CAD" && op2 == "USD") {
                              txt_f.text =
                                  (double.parse(txt_i.text) * 0.75).toString();
                            } else if (op1 == "USD" && op2 == "CAD") {
                              txt_f.text =
                                  (double.parse(txt_i.text) / 0.75).toString();
                            } else {
                              txt_f.text =
                                  (double.parse(txt_i.text) / 1).toString();
                            }
                          }

                          print(calcu[index].titulo);
                        },
                        title: Center(
                          child: (index == 9 || index == 11)
                              ? calcu[index].icono
                              : Text(calcu[index].titulo),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
