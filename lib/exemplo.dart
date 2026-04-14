import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PaginaCurriculo()));
}

class PaginaCurriculo extends StatefulWidget {
  const PaginaCurriculo({super.key});

  @override
  State<PaginaCurriculo> createState() => _PaginaCurriculoState();
}

class _PaginaCurriculoState extends State<PaginaCurriculo> {
  // Chave global para validar o formulário
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabalhe Conosco'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600), // Limita a largura no navegador
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'Envie seu Currículo',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Campo Nome
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) => value!.isEmpty ? 'Digite seu nome' : null,
                ),
                const SizedBox(height: 15),

                // Campo Email
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => !value!.contains('@') ? 'E-mail inválido' : null,
                ),
                const SizedBox(height: 15),

                // Campo Experiência (Área de texto)
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Resumo da Experiência',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Botão de Envio
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Aqui você colocaria a lógica para enviar os dados
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Enviando currículo...')),
                      );
                    }
                  },
                  child: const Text('CADASTRAR CURRÍCULO',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}