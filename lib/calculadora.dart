import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() => runApp(const CalculadoraApp());

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CalculadoraComImagem(),
    );
  }
}

class CalculadoraComImagem extends StatefulWidget {
  const CalculadoraComImagem({super.key});

  @override
  State<CalculadoraComImagem> createState() => _CalculadoraComImagemState();
}

class _CalculadoraComImagemState extends State<CalculadoraComImagem> {
  String _expressao = '';
  String _resultado = '0';

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == 'C') {
        _expressao = '';
        _resultado = '0';
      } else if (valor == '=') {
        try {
          _calcularResultado();
        } catch (e) {
          _resultado = 'Erro';
        }
      } else {
        _expressao += valor;
      }
    });
  }

  void _calcularResultado() {
    String expressaoFinal = _expressao
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll('x', '*');

    final expression = Expression.parse(expressaoFinal);
    final evaluator = const ExpressionEvaluator();
    final r = evaluator.eval(expression, {});

    setState(() {
      _resultado = r.toString();
    });
  }

  Widget _criarBotao(String texto, {Color? cor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24),
            backgroundColor: cor ?? Colors.grey[850],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () => _pressionarBotao(texto),
          child: Text(
            texto,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('🧮 Calculadora Pro'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          // 🎨 LADO DA IMAGEM (40% da tela)
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple.shade400,
                    Colors.blue.shade600,
                    Colors.indigo.shade700,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Ícone grande da calculadora
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.calculate_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Animações de números
                  Column(
                    children: [
                      Text(
                        '🎯',
                        style: TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Precisão Total',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Matemática Perfeita',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Botões decorativos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _botaoDecorativo(Icons.history, 'Histórico'),
                      _botaoDecorativo(Icons.settings, 'Config'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // 📱 LADO DA CALCULADORA (60% da tela)
          Expanded(
            flex: 3,
            child: Column(
              children: [
                // Display
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _expressao.isEmpty ? '0' : _expressao,
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.grey[400],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _resultado,
                          style: const TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Teclado
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(children: [
                          _criarBotao('7'), _criarBotao('8'), _criarBotao('9'), _criarBotao('÷', cor: Colors.orange),
                        ]),
                        Row(children: [
                          _criarBotao('4'), _criarBotao('5'), _criarBotao('6'), _criarBotao('×', cor: Colors.orange),
                        ]),
                        Row(children: [
                          _criarBotao('1'), _criarBotao('2'), _criarBotao('3'), _criarBotao('-', cor: Colors.orange),
                        ]),
                        Row(children: [
                          _criarBotao('C', cor: Colors.redAccent),
                          _criarBotao('0'),
                          _criarBotao('=', cor: Colors.green),
                          _criarBotao('+', cor: Colors.orange),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoDecorativo(IconData icon, String texto) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          texto,
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}