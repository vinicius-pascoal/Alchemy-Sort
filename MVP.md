# Alchemy Sort

## Visão Geral

**Alchemy Sort** é um jogo mobile de puzzle desenvolvido em **Flutter**, no qual o jogador precisa reorganizar poções mágicas entre jarros até que cada frasco contenha apenas uma única poção de mesma cor/tipo.

A proposta combina a mecânica clássica de **sort puzzle** com uma identidade visual de **laboratório arcano**, trazendo uma ambientação mágica, misteriosa e elegante.

---

## Conceito do Jogo

O jogador recebe uma sequência de fases com vários jarros contendo camadas de poções misturadas.  
O objetivo é mover essas camadas de forma estratégica até organizar corretamente todos os jarros.

Cada fase funciona como um desafio lógico de ordenação, exigindo atenção, planejamento e uso eficiente do espaço disponível.

---

## Tema e Identidade Visual

### Tema
- **Poções mágicas**
- **Laboratório arcano**
- **Fantasia mística**

### Direção artística
- fundos escuros com atmosfera de alquimia
- frascos de vidro translúcidos
- líquidos mágicos com brilho suave
- partículas, fumaça e runas decorativas
- interface inspirada em laboratório antigo e magia

### Sensação visual desejada
O jogo deve transmitir a ideia de que o jogador está manipulando elixires raros em uma bancada mágica, dentro de um laboratório antigo repleto de mistérios.

---

## Estilo Visual dos Jarros

O visual dos jarros seguirá a **Opção 2**, usando:

- `Stack`
- `Align`

### Motivo da escolha
Essa abordagem oferece:
- melhor controle visual das camadas das poções
- mais liberdade para animações futuras
- visual mais bonito que uma coluna simples
- maior fidelidade ao tema de frascos mágicos

### Estrutura visual esperada
Cada jarro será composto por:
- contorno externo representando o vidro
- camadas internas posicionadas com `Stack`
- alinhamento vertical das poções usando `Align`
- efeito de transparência no frasco
- brilho leve no conteúdo
- destaque visual ao selecionar o jarro

---

## Objetivo do Jogador

Organizar todas as poções até que:
- cada jarro contenha apenas um único tipo de poção
- ou esteja vazio

A fase termina quando todos os jarros estiverem resolvidos corretamente.

---

## Regras do Jogo

### Regras de movimentação
O jogador pode transferir poção de um jarro para outro quando:

1. o jarro de origem não estiver vazio
2. o jarro de destino não estiver cheio
3. o topo do jarro de destino for igual ao topo do jarro de origem  
   **ou**
4. o jarro de destino estiver vazio

### Regras adicionais
- apenas a camada do topo pode ser movida
- futuramente, pode ser permitido mover blocos consecutivos da mesma cor
- cada jarro possui uma capacidade máxima fixa

---

## Condição de Vitória

Uma fase é considerada concluída quando:

- todos os jarros estiverem vazios  
  **ou**
- todos os jarros preenchidos tiverem apenas uma única cor/tipo de poção

---

## Público-Alvo

- jogadores casuais
- fãs de puzzle mobile
- público que gosta de jogos relaxantes com estética mágica
- jogadores que apreciam desafios lógicos com progressão por fases

---

## Plataforma

- **Flutter**
- foco inicial em **Android**
- possibilidade futura de expandir para iOS e Web

---

## Stack Recomendada

### Base do projeto
- **Flutter**
- **Dart**

### Gerenciamento de estado
- **Provider** ou **Riverpod**

### Persistência local
- **shared_preferences**

### Navegação
- navegação padrão do Flutter
- ou `go_router` caso o projeto cresça

### Animações
- `AnimatedContainer`
- `TweenAnimationBuilder`
- `AnimatedPositioned`
- possibilidade futura de usar `flutter_animate`

### Áudio e feedback
- sons leves de interface
- feedback ao concluir jogadas
- vibração opcional em dispositivos compatíveis

---

## Funcionalidades do MVP

### Funcionalidades principais
- tela inicial
- seleção de fases
- tela principal do puzzle
- movimentação entre jarros
- validação de jogadas
- verificação de vitória
- reiniciar fase
- desfazer movimento
- contador de movimentos
- salvar progresso localmente

### Funcionalidades visuais do MVP
- destaque do jarro selecionado
- camadas coloridas nas poções
- fundo com estética de laboratório arcano
- interface com identidade mágica

---

## Telas do Jogo

## 1. Tela Inicial
### Elementos
- logo **Alchemy Sort**
- botão **Jogar**
- botão **Fases**
- botão **Configurações**
- fundo com laboratório arcano

---

## 2. Tela de Seleção de Fases
### Elementos
- lista ou grade de fases
- indicação de fases desbloqueadas
- fase atual destacada
- progresso salvo localmente

---

## 3. Tela do Puzzle
### Elementos
- nome ou número da fase
- contador de movimentos
- jarros centralizados na tela
- botão de reiniciar
- botão de desfazer
- botão de voltar
- feedback visual de fase concluída

---

## 4. Tela de Configurações
### Elementos
- som ligado/desligado
- música ligada/desligada
- vibração ligada/desligada
- resetar progresso

---

## Mecânicas Centrais

### Seleção de jarros
A mecânica principal será:
1. jogador toca no jarro de origem
2. jogador toca no jarro de destino
3. o sistema verifica se a jogada é válida
4. a movimentação acontece
5. o estado do puzzle é atualizado
6. o sistema verifica vitória

### Estrutura de capacidade
Exemplo:
- cada jarro suporta 4 camadas
- cada camada representa uma poção/cor

Exemplo de conteúdo:
- `[roxo, roxo, azul, verde]`

---

## Modelagem Inicial

## Entidade Jar
Cada jarro deve conter:
- capacidade máxima
- lista de camadas
- verificação de vazio
- verificação de cheio
- item do topo
- status de concluído

## Entidade Fase
Cada fase deve conter:
- identificador da fase
- lista de jarros
- dificuldade
- quantidade mínima de movimentos estimada
- estado de conclusão

---

## Estrutura de Pastas Sugerida

```text
lib/
  main.dart
  app/
    app_widget.dart
    routes.dart
  core/
    constants/
    theme/
    utils/
  features/
    home/
      presentation/
        pages/
        widgets/
    game/
      domain/
        entities/
          jar.dart
          level.dart
        logic/
          puzzle_rules.dart
      presentation/
        pages/
          game_page.dart
        widgets/
          jar_widget.dart
          game_top_bar.dart
          action_buttons.dart
      state/
        game_controller.dart
    levels/
      data/
        level_repository.dart
    settings/
      presentation/
        pages/
