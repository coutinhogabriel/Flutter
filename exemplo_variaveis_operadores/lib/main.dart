/*void main() {
 //Declarando e inicializando variaveis
  String nome = "João";
  int idade = 25;
  double altura = 1.75;
  bool estudante = true;

  //Imprimindo variaveis
  print("Nome: $nome");
  print("Idade: $idade anos");
  print("Altura: $altura metros");
  print("Estudante: $estudante");
}*/

/*void main() {
// Operações aritméticas com variáveis
  int numero1 = 10;
  int numero2 = 5;

  int soma = numero1 + numero2;
  int subtracao = numero1 - numero2;
  int multiplicacao = numero1 * numero2;
  double divisao = numero1 / numero2;

// Imprimindo resultados
  print("Soma: $soma");
  print("Subtração: $subtracao");
  print("Multiplicação: $multiplicacao");
  print("Divisão: $divisao");
}*/

/*void main() {
// Concatenação de strings com variáveis
  String nome = "Maria";
  int idade = 30;

// Utilizando concatenação
  String mensagem = "Olá, meu nome é $nome e tenho $idade anos.";

// Imprimindo a mensagem
  print(mensagem);
}*/

//Exemplo 4: Alteração Dinâmica de Variáveis (Mutabilidade)
void main() {
// Variáveis mutáveis
  var numero = 42;
  print("Número inicial: $numero");

// Alterando o valor da variável
  numero = 100;
  print("Número alterado: $numero");

// Variável de tipo dinâmico
  dynamic variavelDinamica = "Texto";
  print("Variável dinâmica: $variavelDinamica");

// Alterando dinamicamente o tipo e valor
  variavelDinamica = 42;
  print("Variável dinâmica alterada: $variavelDinamica");
}
