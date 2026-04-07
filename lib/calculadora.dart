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
      home: const Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState(); // ✅ CORRIGIDO: Retorno explícito
}

class _CalculadoraState extends State<Calculadora> {
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
    // ✅ CORRIGIDO: Tratamento completo dos operadores
    String expressaoFinal = _expressao
        .replaceAll('×', '*')  // Multiplicação
        .replaceAll('÷', '/')  // Divisão
        .replaceAll('x', '*'); // Caso use 'x'

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
            foregroundColor: Colors.white, // ✅ ADICIONADO: Cor do texto
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => _pressionarBotao(texto),
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // ✅ ADICIONADO: Fundo escuro
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Display de resultados
          Expanded(
            flex: 2, // ✅ ADICIONADO: Proporção melhor
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expressao.isEmpty ? '0' : _expressao,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _resultado,
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Teclado ✅ CORRIGIDO: Layout completo
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
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
        ],
      ),
    );
  }
}