# NanoChallenge05

# AI Buster

**AI Buster** é um aplicativo iOS que analisa e identifica se um texto foi gerado por uma Inteligência Artificial ou por um ser humano. O modelo de machine learning usado para essa verificação foi treinado no **CreateML** da Apple, proporcionando alta precisão e eficiência.

## Funcionalidades

- **Detecção Automática**: Insira um texto e o aplicativo determinará se ele foi gerado por uma IA ou por uma pessoa.
- **Modelo de Machine Learning**: O modelo foi criado e treinado utilizando o CreateML, garantindo uma integração nativa com o iOS.
- **Feedback Rápido**: O resultado da análise é retornado de forma ágil e fácil de entender.
- **Interface Simples**: Uma interface amigável e intuitiva para uma experiência de usuário otimizada.

## Tecnologias Utilizadas

- **SwiftUI**: Para o desenvolvimento da interface de usuário.
- **CoreML**: Integração do modelo de machine learning treinado no CreateML.
- **CreateML**: Ferramenta da Apple usada para treinar o modelo de detecção de texto gerado por IA.

## Como Funciona

1. O usuário insere um texto no campo de entrada.
2. O texto é enviado para o modelo de machine learning, que foi previamente treinado com exemplos de textos gerados por humanos e por IA.
3. O aplicativo retorna o resultado, indicando se o texto foi gerado por uma IA ou por um humano.

## Requisitos

- **Xcode 13+**
- **iOS 15+**
- **Swift 5+**

## Instalação

1. Clone o repositório:

   ```bash
   git https://github.com/GuilhermeNL01/NanoChallenge05.git
   ```

2. Abra o projeto no Xcode:

   ```bash
   cd NanoChallenge05
   open NanoChallenge05.xcodeproj
   ```

3. Compile e execute o projeto no simulador ou em um dispositivo real.

## Modelo de Machine Learning

O modelo foi treinado no **CreateML** com um conjunto de dados contendo textos gerados por IA e humanos.

## Contribuindo

Se você deseja contribuir para o desenvolvimento deste projeto:

1. Faça um fork do repositório.
2. Crie uma nova branch para sua feature ou correção de bug: `git checkout -b minha-feature`.
3. Faça o commit de suas alterações: `git commit -m 'Minha nova feature'`.
4. Envie suas alterações para a branch principal: `git push origin minha-feature`.
5. Abra um Pull Request.
