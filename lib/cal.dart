import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MinhaPaginaFlutter(),
    debugShowCheckedModeBanner: false,
  ));
}

class MinhaPaginaFlutter extends StatefulWidget {
  const MinhaPaginaFlutter({super.key});

  @override
  State<MinhaPaginaFlutter> createState() => _MinhaPaginaFlutterState();
}

class _MinhaPaginaFlutterState extends State<MinhaPaginaFlutter> {
  // Controladores para ler o que você digita
  final TextEditingController _controller1 = TextEditingController(text: "10");
  final TextEditingController _controller2 = TextEditingController(text: "5");

  // Variáveis que vão guardar os números
  int numero1 = 10;
  int numero2 = 5;

  void _atualizarCalculo() {
    // setState avisa o Flutter para "desenhar" a tela de novo com os novos números
    setState(() {
      numero1 = int.tryParse(_controller1.text) ?? 0;
      numero2 = int.tryParse(_controller2.text) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> frutas = ["🍎 Maçã", "🍌 Banana", "🍊 Laranja"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora Interativa 2026"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView( // Permite rolar a tela se ficar pequena
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("🔢 Digite os números para calcular:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Campo para o primeiro número
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Número 1", border: OutlineInputBorder()),
              onChanged: (_) => _atualizarCalculo(),
            ),
            const SizedBox(height: 10),

            // Campo para o segundo número
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Número 2", border: OutlineInputBorder()),
              onChanged: (_) => _atualizarCalculo(),
            ),

            const Divider(height: 40),

            const Text("📊 Resultados:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Soma: $numero1 + $numero2 = ${numero1 + numero2}"),
            Text("Subtração: $numero1 - $numero2 = ${numero1 - numero2}"),
            Text("Multiplicação: $numero1 * $numero2 = ${numero1 * numero2}"),
            // Evita erro de divisão por zero
            Text("Divisão Inteira: ${numero2 != 0 ? (numero1 ~/ numero2) : 'Erro (divisão por 0)'}"),

            const SizedBox(height: 30),
            const Text("🍎 Minhas Frutas:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            for (var (i, fruta) in frutas.indexed)
              Text("${i + 1}. $fruta"),
          ],
        ),
      ),
    );
  }
}