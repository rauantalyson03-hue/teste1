import 'dart:io';  // Removido import Java incorreto

void main() {
  // 1. Definindo uma variável simples
  // Usamos 'final' para valores que não mudam após a atribuição
  final String usuario = "Visitante";

  // 2. Criando uma lista de strings
  List<String> compras = ["Café", "Teclado Mecânico", "Monitor", "Chocolate"];

  print("Olá, $usuario! Aqui está sua lista de itens:");
  print("---");

  // 3. Chamando uma função para processar a lista
  exibirLista(compras);

  // 4. Adicionando um item extra e verificando uma condição
  String novoItem = "Mousepad";

  if (!compras.contains(novoItem)) {
    print("\nAdicionando $novoItem à lista...");
    compras.add(novoItem);
  }

  print("\nLista atualizada:");
  exibirLista(compras);
}

// Função simples para evitar repetição de código
void exibirLista(List<String> itens) {
  // CORREÇÃO: Sintaxe correta para iterar com índice
  for (int i = 0; i < itens.length; i++) {
    print("${i + 1}. ${itens[i]}");
  }
  // Alternativa moderna (Dart 2.17+):
  /*
    for (var (index, item) in itens.indexed) {
        print("${index + 1}. $item");
    }
    */
}