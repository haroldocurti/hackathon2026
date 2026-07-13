# Memoria do projeto do site - Hackathon Senac Ribeirao Preto 2026

## Proposito do site

O site sera o portal oficial do Hackathon Senac Ribeirao Preto 2026. Deve apresentar o projeto, organizar as informacoes essenciais para participantes e equipe organizadora, publicar regras, centralizar materiais, mostrar cronograma, explicar trilhas/desafios e instigar colaboracao.

### Decisao de produto — 13 de julho de 2026

O site passa a ter como publico prioritario, nesta etapa, a **equipe organizadora**. Sua primeira funcao e ser a central de gestao e consulta do projeto, permitindo que qualquer pessoa da organizacao identifique rapidamente:

- a fase atual e o proximo marco;
- as decisoes pendentes e seus prazos;
- as frentes de trabalho e responsabilidades;
- o cronograma mestre;
- os riscos e bloqueios imediatos;
- os documentos oficiais e materiais de referencia;
- as informacoes consolidadas do evento.

O conteudo voltado aos participantes continua presente como referencia, mas deixa de ocupar a primeira camada da experiencia. A pagina inicial deve abrir com a visao executiva da organizacao.

### Decisao de arquitetura — 13 de julho de 2026

O portal deixa de ficar restrito a uma pagina unica. A pagina inicial funciona como painel executivo e cada grande grupo de informacao possui uma pagina HTML dedicada: cronograma, status, projeto, regulamento, tarefas, trilhas, tematica, fundamentos pedagogicos e memoria do portal.

Os arquivos Markdown sao fontes editoriais internas e nao devem ser abertos diretamente pela navegacao publica. O fluxo de manutencao passa a ser:

1. atualizar os documentos Markdown;
2. gerar novamente as paginas HTML correspondentes;
3. revisar os destaques da pagina inicial;
4. validar a navegacao e publicar.

Esse modelo permite que a equipe mantenha informacoes extensas e detalhadas sem sobrecarregar a pagina principal, ao mesmo tempo em que preserva uma unica fonte de conteudo para futuras atualizacoes.

O sucesso da primeira versao e que, em uma unica experiencia de navegacao, qualquer participante entenda:

- o que e o Hackathon;
- por que ele existe;
- quem pode participar;
- quando e onde acontece;
- quais sao as trilhas;
- o que precisa ser entregue;
- como os projetos serao avaliados;
- onde encontrar materiais, regras e contatos.

## Contexto central

Nome de trabalho: Hackathon Senac Ribeirao Preto 2026.

Data prevista: 6 e 7 de novembro de 2026.

Local: Senac Ribeirao Preto.

Formato previsto: presencial com possibilidade de atividades hibridas no primeiro dia.

Publico principal: estudantes de cursos tecnicos do Senac Ribeirao Preto, organizados em equipes de 3 a 6 integrantes.

Categoria adicional prevista: Hackateen, voltada a estudantes do Ensino Medio Tecnico (EMED) e cursos livres, como Idiomas.

Publicos secundarios do site: mentores, jurados, organizadores e possiveis patrocinadores/parceiros.

## Posicionamento

O evento nao deve ser comunicado como uma competicao apenas de codigo. A mensagem central e que tecnologia e um meio para gerar impacto social, economico, ambiental e comunitario.

Frase-guia:

> Nao queremos apenas projetos. Queremos impacto.

Ideias-forca:

- aprender fazendo;
- protagonismo estudantil;
- colaboracao entre cursos e areas;
- diversidade de saberes;
- tecnologia como ferramenta de transformacao;
- solucoes viaveis para dores reais da comunidade local;
- Ribeirao Preto como territorio vivo dos desafios.

## Tema visual e narrativo

Tema oficial: O Tear de Jacquard - entrelacando tecnologias, pessoas e impacto.

A metafora do tear deve orientar o visual e a narrativa:

- fios individuais representam talentos, cursos e trajetorias;
- a trama coletiva representa colaboracao;
- cartoes perfurados representam programacao, processo e intencionalidade;
- tecer representa criar solucoes de impacto;
- a relacao entre artesanato e computacao ajuda a mostrar tecnologia como algo humano, acessivel e interdisciplinar.

Direcao visual sugerida:

- energia de hackathon, mas com calor humano;
- referencias a tecido, linhas, tramas, cartoes perfurados e padroes;
- evitar uma aparencia fria, corporativa ou puramente tech;
- combinar base acolhedora com acentos modernos;
- usar elementos visuais que sugiram conexao, movimento, montagem e colaboracao.

## Restricoes tecnicas

Hospedagem prevista: GitHub Pages.

Consequencias:

- preferir site estatico;
- sem backend proprio;
- conteudo editavel por arquivos locais do repositorio;
- formularios, inscricoes, rankings dinamicos ou submissao de ideias devem depender de ferramentas externas, se forem usados;
- evitar funcionalidades que exijam login, banco de dados ou painel administrativo customizado.

Possiveis integracoes externas, se necessarias:

- Google Forms ou Microsoft Forms para inscricoes e perguntas;
- planilha publicada para resultados ou cronogramas atualizaveis;
- links para documentos, materiais e regulamento;
- embeds simples quando fizer sentido.

## Conteudos essenciais

Estrutura recomendada para uma primeira versao em pagina unica:

1. Hero / abertura
   - nome do evento;
   - data e local;
   - promessa central de impacto;
   - chamada para entender trilhas, regras e entregas.

2. Sobre o Hackathon
   - manifesto resumido;
   - foco em tecnologia como suporte para transformacao;
   - reforco de que nao e apenas para programadores.

3. Tema: Tear de Jacquard
   - explicacao curta da metafora;
   - conexao entre artesanato, programacao e colaboracao;
   - frases inspiracionais para manter o tom energetico.

4. Quem participa
   - cursos tecnicos;
   - equipes de 3 a 6 pessoas;
   - incentivo a equipes mistas;
   - categoria Hackateen, se confirmada.

5. Cronograma
   - Dia 1: abertura, oficinas, formacoes, networking e consolidacao das equipes;
   - Dia 2: maratona de desenvolvimento, mentorias, submissao, pitches, avaliacao e premiacao.

6. Trilhas de desafio
   - Inclusao e Acessibilidade;
   - Trabalhabilidade e Geracao de Renda;
   - Saude e Bem-Estar;
   - Sustentabilidade e Consumo Consciente;
   - Diversidade, Equidade e Inclusao.

   Cada trilha deve ter resumo, foco, exemplos de dores, personas ou perguntas norteadoras e link/expansao para detalhes.

7. Entregas obrigatorias
   - prototipo da solucao;
   - modelo de viabilidade;
   - apresentacao de impacto;
   - pitch final de 3 a 6 minutos, a confirmar.

8. Criterios de avaliacao
   - Impacto Social Real: 30%;
   - Viabilidade e Sustentabilidade: 25%;
   - Criatividade e Inovacao: 20%;
   - Experiencia do Usuario / Prototipo: 15%;
   - Pitch e Comunicacao: 10%.

9. Mentores e jurados
   - explicar papel dos mentores;
   - explicar composicao ideal da banca: especialista tecnico, especialista social/educacional e representante do mercado local.

10. Materiais e links uteis
    - regulamento;
    - guias de trilhas;
    - fontes e referencias;
    - modelos de pitch ou canvas, quando existirem;
    - contato da organizacao.

11. FAQ
    - precisa saber programar?
    - posso montar equipe com pessoas de outros cursos?
    - como escolher uma trilha?
    - o que conta como prototipo?
    - quais criterios valem mais?
    - como funcionam mentoria e pitch?

## Trilhas

### 1. Inclusao e Acessibilidade

Foco: romper barreiras fisicas, sensoriais e cognitivas no cotidiano e no digital.

Exemplos de temas:

- acessibilidade de informacao;
- inclusao digital de pessoas idosas;
- recursos assistivos;
- atendimento inclusivo em pequenos comercios e equipamentos culturais.

Personas de referencia:

- Seu Antenor, pessoa idosa com dificuldade de leitura e interacao em apps;
- Leticia, estudante cega que depende de leitores de tela.

### 2. Trabalhabilidade e Geracao de Renda

Foco: conectar talentos ao mercado local, apoiar autonomia financeira e fortalecer microempreendedores.

Exemplos de temas:

- conexao de profissionais tecnicos com oportunidades;
- precificacao e formalizacao de servicos;
- ferramentas simples para MEIs;
- educacao financeira pratica.

Personas de referencia:

- Thiago, egresso tecnico buscando primeiras oportunidades;
- Clara, costureira MEI que precisa organizar vendas, estoque e fluxo de caixa.

### 3. Saude e Bem-Estar

Foco: prevencao, saude mental, autocuidado, fluxos de acolhimento e gestao de atendimento.

Exemplos de temas:

- saude mental de estudantes;
- monitoramento preventivo de pacientes cronicos;
- canais seguros de acolhimento;
- melhoria de triagem e espera em unidades de saude.

Personas de referencia:

- Gabriela, estudante do EMED com ansiedade e estresse;
- Seu Geraldo, paciente hipertenso que precisa registrar dados de saude.

### 4. Sustentabilidade e Consumo Consciente

Foco: economia circular, reducao de desperdicio, descarte correto e consumo responsavel.

Exemplos de temas:

- logistica reversa;
- descarte de lixo eletronico, pilhas e oleo;
- redistribuicao de alimentos;
- conexao entre produtores locais e consumidores.

Personas de referencia:

- Mariana, moradora que precisa encontrar pontos corretos de descarte;
- Seu Joao, pequeno produtor com excedente de alimentos frescos.

### 5. Diversidade, Equidade e Inclusao

Foco: combate a preconceitos, acesso a direitos, acolhimento e oportunidades para grupos minorizados.

Exemplos de temas:

- acolhimento de imigrantes e refugiados;
- traducao e acesso a servicos;
- recrutamento com menos vieses;
- difusao de cultura antirracista e inclusiva.

Personas de referencia:

- Jean, imigrante haitiano com barreiras linguisticas e documentais;
- Aline, jovem negra e mulher trans buscando entrada segura no mercado.

## Tom de voz

O texto do site deve ser:

- claro, direto e acolhedor;
- energico, mas nao exageradamente publicitario;
- institucional o suficiente para passar confianca;
- jovem o suficiente para engajar participantes;
- inclusivo, evitando apresentar tecnologia como territorio exclusivo da TI.

Evitar:

- excesso de jargao tecnico;
- texto longo demais na primeira dobra;
- transformar o site em uma copia integral dos documentos;
- prometer funcionalidades interativas que o GitHub Pages nao sustenta sozinho.

## Decisoes iniciais tomadas

- O site sera em portugues.
- O foco sera uma experiencia de pagina unica, com possibilidade de secoes expansivas ou links para documentos.
- O site deve servir como portal oficial completo, mas sem depender de backend.
- Nao ha necessidade de contribuicao direta via GitHub pelo publico.
- Atualizacoes frequentes durante o evento nao sao prioridade.
- A identidade visual ainda nao existe; ela deve nascer da tematica do Tear de Jacquard e do carater energetico de hackathon.

## Pontos ainda em aberto

- Nome oficial final do evento.
- Confirmacao da categoria Hackateen.
- Link ou ferramenta oficial de inscricao, caso exista.
- Contato oficial da organizacao.
- Lista real de mentores, jurados e parceiros.
- Premiacoes finais.
- Cronograma detalhado por horario.
- Materiais de apoio que serao disponibilizados.
- Decisao entre ranking publico, apenas finalistas ou apenas vencedores.
