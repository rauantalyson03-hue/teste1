import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MinhaPaginaFlutter(),
    debugShowCheckedModeBanner: false,
  ));
}

class MinhaPaginaFlutter extends StatelessWidget {
  const MinhaPaginaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    // --- SUA LÓGICA DO ARQUIVO ADICIONA.DART COMEÇA AQUI ---
    int numero1 = 10;
    int numero2 = 5;
    List<String> frutas = ["🍎 Maçã", "🍌 Banana", "🍊 Laranja"];
    // --- FIM DA SUA LÓGICA ---

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu App Flutter 2026"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("🎉 Olá! Bem-vindo ao Dart visual!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Divider(),
            const Text("🔢 Resultados da Calculadora:", style: TextStyle(fontSize: 18)),
            Text("Soma: $numero1 + $numero2 = ${numero1 + numero2}"),
            Text("Subtração: $numero1 - $numero2 = ${numero1 - numero2}"),
            Text("Multiplicação: $numero1 * $numero2 = ${numero1 * numero2}"),
            Text("Divisão Inteira: $numero1 / $numero2 = ${numero1 ~/ numero2}"),
            const SizedBox(height: 20),
            const Text("🍎 Minhas Frutas:", style: TextStyle(fontSize: 18)),

            // Aqui transformamos sua lista em Widgets de texto na tela
            for (var (i, fruta) in frutas.indexed)
              Text("${i + 1}. $fruta"),
          ],
        ),
      ),
    );
  }
}