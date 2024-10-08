# Movie App

Este é um aplicativo de filmes construído com Flutter, utilizando arquitetura modular e Clean
Architecture.
O aplicativo permite que os usuários visualizem, pesquisem e obtenham informações sobre filmes por
meio de uma interface amigável.

## Estrutura do Projeto

O projeto segue uma estrutura organizada em camadas, visando escalabilidade, manutenção e facilidade
de testes.
As principais pastas e componentes são:

### lib

- **app**: Contém o `AppWidget`, que é o ponto de entrada do aplicativo.
- **core**: Responsável por recursos compartilhados em todo o projeto, incluindo:
    - **infra**:
        - `local_storage`: Serviços de armazenamento local.
        - `network`: Informações e serviços relacionados à conectividade de rede.
        - `http`: Serviço HTTP para interações de rede.
    - **utils**: Utilitários de uso geral, como debounce e single execution helpers.
    - **error**: Classes e interfaces para o tratamento de erros e falhas.
    - **injection**: Configuração de injeção de dependência.
- **features**: Contém o módulo de filmes. Está organizado em três camadas principais:
    - **Apresentação (`presentation`)**: Inclui páginas, controladores e widgets.
    - **Dados (`data`)**: Camada de dados com fontes de dados locais e remotos e mapeamento para
      DTOs.
    - **Domínio (`domain`)**: Inclui as entidades e os casos de uso.

## Funcionalidades

- **Listagem de Filmes**: Exibe uma lista de filmes com informações como título, gênero, avaliação e
  imagem.
- **Pesquisa de Filmes**: Permite ao usuário pesquisar filmes pelo título.
- **Cache Offline usando Decorator Pattern**: Implementação de cache para operações offline,
  utilizando o Decorator Pattern,
  que permite armazenar e recuperar dados locais quando não há conexão com a internet,
  proporcionando uma experiência de
  usuário contínua.

## Tecnologias Utilizadas

- **Flutter**: Para o desenvolvimento de interfaces de usuário nativas.
- **Dio**: Gerenciamento de requisições HTTP.
- **Shared Preferences**: Armazenamento local de dados leves.
- **Arquitetura Modular e Clean Architecture**: Estruturação do código em camadas de forma
  independente e modular.

## Instalação e Execução

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/pablostefan/movie_app.git
   ```

2. **Navegue até o diretório do projeto**:
   ```bash
   cd movie_app
   ```

3. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

4. **Configuração do Ambiente**:
    - Crie um arquivo `.env` na raiz do projeto e adicione as variáveis de ambiente necessárias,
      como tokens e chaves de API.
    - Exemplo de arquivo `.env`:
       ```plaintext
        BEARER_TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNzhlNmIxODMwODQ3MmMxMmQ2YWUwNDc5MTliY2RiZiIsIm5iZiI6MTcyODA5NTY0OC4zMTA1NDYsInN1YiI6IjY0NTEzZDlhNDM1MDExMDBlYTNhMTk1ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.J2Gju5G6gE0_Twm-hVIpwGQxydd-utKgFlzV9rPYTZE
        BASE_URL=https://api.themoviedb.org/3
        TRENDING_MOVIES_URL=/trending/movie/week
        SEARCH_MOVIES_URL=/search/movie
        IMAGE_URL=https://image.tmdb.org/t/p/w500
        ```

5. **Execute o aplicativo com o arquivo `.env`**:
    ```bash
    flutter run --dart-define-from-file=.env
    ```

> **Nota**: O comando `--dart-define-from-file=.env` é necessário para carregar as variáveis de
> ambiente configuradas no arquivo `.env`.

## Estrutura de Pastas

```plaintext
lib/
├── app/                         # Ponto de entrada do aplicativo
├── core/                        # Recursos compartilhados e infraestrutura
│   ├── error/                   # Tratamento de erros e falhas
│   ├── infra/
│   │   ├── local_storage/       # Armazenamento local
│   │   ├── network/             # Conectividade de rede
│   │   └── http/                # Serviços HTTP
│   ├── utils/                   # Utilitários diversos
│   └── injection/               # Injeção de dependências
└── features/
    └── movies/                  # Módulo de filmes
        ├── data/                # Camada de dados
        ├── domain/              # Camada de domínio
        └── presentation/        # Camada de apresentação
```

## Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Envie para o branch (`git push origin feature/nova-feature`)
5. Crie um novo Pull Request

