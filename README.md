# Modelo LaTeX para Trabalhos Acadêmicos do Instituto de Informática (INF/UFRGS)

Este repositório contém a classe e os modelos em LaTeX para a elaboração de Trabalhos de Conclusão de Curso (TCC / TC), Dissertações de Mestrado, Teses de Doutorado e Relatórios Acadêmicos do **Instituto de Informática (INF)** da **Universidade Federal do Rio Grande do Sul (UFRGS)**.

O projeto é compatível tanto com ambientes locais modernos (TeX Live 2021+) quanto com o **Overleaf**, oferecendo suporte nativo ao ecossistema moderno `biblatex` + `biber` e aderência às normas da **ABNT** (NBR 14724, NBR 6023, NBR 10520, NBR 6027) e às orientações do **IBGE**.

---

## 1. Origem e Histórico

Este modelo é uma evolução direta da tradicional classe institucional `iiufrgs` (desenvolvida originalmente pelo *UFRGS TeX Users Group - UTUG* e amplamente difundida no Instituto) e do pacote mantido no GitHub pelo Prof. Lucas Mello Schnorr ([schnorr/infufrgs](https://github.com/schnorr/infufrgs)).

A presente versão foi adaptada e atualizada pelo **Prof. Leandro Krug Wives**, com o auxílio do **Gemini** (Advanced Agentic Coding), com o objetivo de sanar limitações históricas de pacotes depreciados, modernizar o motor bibliográfico para `biblatex`/`biber` sem quebrar a compatibilidade com documentos legados, e transformar os modelos em guias metodológicos ricos e didáticos para os estudantes de graduação e pós-graduação.

---

## 2. Modificações Realizadas e Justificativas

### A. Integração com `biblatex` + `biber` e `biblatex-abnt` (Modernização Bibliográfica)
* **Antes**: O modelo dependia exclusivamente de `abntex2cite` + `bibtex` (`abntex2-alf.bst`), um formato legado com limitações no suporte a caracteres UTF-8 em chaves, campos modernos (`doi`, `url`, `urldate`) e customizações avançadas da norma ABNT NBR 10520.
* **Agora**: Suporte nativo à opção `biblatex` (`\documentclass[...,biblatex]{iiufrgs}`), configurada automaticamente com o estilo `abnt` e processada via `biber`.
* **Compatibilidade**: Documentos antigos que usam `abntex2cite` continuam funcionando via opção `\documentclass[...,abntex2cite]{iiufrgs}`. Foram fornecidos mapeamentos para comandos de citação de estilo `natbib` (`\textcite`, `\parencite`, `\citet`, `\citep`, `\citeonline`, `\citeyearpar`).

### B. Substituição de Pacotes Obsoletos (`tocstyle` $\rightarrow$ `tocbasic`)
* **Antes**: A classe utilizava o pacote `tocstyle`, que foi descontinuado do KOMA-Script há anos e emitia avisos severos e erros de quebra de página em instalações recentes do TeX Live.
* **Agora**: A formatação do Sumário (`\tableofcontents`), Lista de Figuras (`\listoffigures`) e Lista de Tabelas (`\listoftables`) foi portada para `tocbasic` (padrão moderno do KOMA-Script), garantindo compilação limpa em qualquer distribuição recente.

### C. Tipografia e Fontes Modernas (TeX Gyre)
* **Antes**: Havia dependência de fontes antigas do Computer Modern que disparavam a compilação lenta de fontes rasterizadas via METAFONT (`mktexpk`).
* **Agora**: Utilização da família **TeX Gyre** (`tgtermes` para serifas, `tgheros` para sem-serifas e `tgcursor` para monoespaçadas), fornecendo fontes PostScript Tipo 1 / OpenType de alta qualidade visual, com suporte completo a caracteres acentuados.

### D. Gestão Dinâmica de Nominata Institucional
* **Antes**: Nomes de reitores, pró-reitores e diretores vinham fixados em arquivos antigos ou demandavam edição manual de múltiplos arquivos.
* **Agora**: O arquivo `nominata.def` centraliza a gestão institucional atualizada. Os arquivos de curso (`cic.def`, `ecp.def`, etc.) mapeiam dinamicamente os papéis específicos (coordenadores e pró-reitorias correspondentes). Caso ocorram mudanças de gestão, o usuário pode redefinir comandos diretamente no preâmbulo (`\renewcommand{\nominataCoord}{...}`) ou usar um arquivo `nominatalocal.def`.

### E. Modelos Didáticos e Metodológicos (`cic-tc.tex`, `ecp-tc.tex`, `iiufrgs.tex`)
* Os arquivos de exemplo foram substancialmente enriquecidos para servirem como **roteiro instrutivo para os estudantes**:
  1. **Estrutura monográfica**: Explicação clara sobre o papel dos elementos pré-textuais, textuais (Capítulos 1 a 6: Introdução, Trabalhos Relacionados, Fundamentação Teórica, Metodologia, Avaliação Experimental e Conclusão) e pós-textuais.
  2. **Citações ABNT NBR 10520**: Exemplificação prática das modalidades:
     - Citação Indireta (paráfrase no fluxo do texto e entre parênteses);
     - Citação Direta Curta (até 3 linhas, entre aspas duplas e com indicação de página obrigatória);
     - Citação Direta Longa (mais de 3 linhas, em bloco com recuo de 4 cm, tamanho 10 pt, espaçamento simples, ambiente `citacao`);
     - Citação de citação (*Apud*).
  3. **Figuras e Tabelas segundo IBGE e ABNT**: Demonstração de que **a indicação de fonte/autoria é obrigatória mesmo para produções do próprio autor** (`Fonte: Elaborada pelo autor`), além de exemplos com citação e página para imagens e tabelas adaptadas de outros autores. Tabelas formatadas com linhas abertas profissionais via `booktabs`.
  4. **Listagens de código e matemática**: Exemplos configurados de `listings` (`lstlisting`) e equações numeradas (`amsmath`).

---

## 3. Estrutura do Repositório

```text
├── iiufrgs.cls          # Classe LaTeX principal do II/UFRGS
├── cic-tc.tex           # Modelo completo de TCC para Ciência da Computação (CIC)
├── ecp-tc.tex           # Modelo de TCC para Engenharia de Computação (ECP)
├── iiufrgs.tex          # Modelo para Pós-Graduação (PPGC/PGMICRO - Mestrado/Doutorado)
├── biblio.bib           # Base de dados bibliográfica (BibTeX / Biber)
├── figures/             # Imagens e ilustrações utilizadas nos exemplos
├── nominata.def         # Definições centrais dos nomes dos gestores da UFRGS e do II
├── cic.def              # Mapeamento específico para Ciência da Computação
├── ecp.def              # Mapeamento específico para Engenharia de Computação
├── dipl.def             # Definição textual para Projetos de Diplomação/TCC
├── formais.def          # Ambientes de teoremas, lemas e definições formais
├── iidefs.sty           # Pacote auxiliar com definições do II/UFRGS
├── brazilian.babel      # Ajustes de internacionalização em português
├── english.babel        # Ajustes de internacionalização em inglês
├── abntex2cite.sty      # Pacote de compatibilidade com modo legado abntex2 (opcional)
├── abntex2-alf.bst      # Estilo BibTeX alfanumérico legado (opcional)
├── latexmkrc            # Configuração do latexmk para compilação automática
└── .gitignore           # Ignora arquivos temporários e auxiliares do LaTeX
```

---

## 4. Como Usar

### No Overleaf (Recomendado)
1. Baixe o repositório como arquivo ZIP (ou use o arquivo `ufrgsLatexModel.zip`).
2. No Overleaf, clique em **New Project** $\rightarrow$ **Upload Project** e selecione o arquivo ZIP.
3. Defina o arquivo principal de acordo com o seu curso:
   - Para Ciência da Computação: configure `cic-tc.tex` como arquivo principal (*Main document*);
   - Para Engenharia de Computação: configure `ecp-tc.tex`;
   - Para Pós-Graduação (PPGC/PGMICRO): configure `iiufrgs.tex`.
4. Certifique-se de que o compilador do Overleaf está configurado para **pdfLaTeX** (o Overleaf detecta e executa o `biber` automaticamente).

### Em Linha de Comando (Linux / macOS / Windows)
Certifique-se de possuir uma distribuição TeX Live instalada (com `pdflatex`, `biber` e `latexmk`).

Para compilar automaticamente o TCC da Ciência da Computação:
```bash
latexmk -pdf -interaction=nonstopmode cic-tc.tex
```

Para Engenharia de Computação:
```bash
latexmk -pdf -interaction=nonstopmode ecp-tc.tex
```

Para monografias do PPGC:
```bash
latexmk -pdf -interaction=nonstopmode iiufrgs.tex
```

Para compilação manual passo a passo:
```bash
pdflatex cic-tc.tex
biber cic-tc
pdflatex cic-tc.tex
pdflatex cic-tc.tex
```

Para limpar arquivos temporários gerados na compilação:
```bash
latexmk -c
```

---

## 5. Autoria e Manutenção

* **Autores Originais**: UFRGS TeX Users Group (UTUG) e colaboradores históricos do INF/UFRGS.
* **Manutenção Prévia (infufrgs)**: Prof. Lucas Mello Schnorr ([@schnorr](https://github.com/schnorr)).
* **Adaptação, Modernização e Guias Metodológicos (2026)**: Prof. Leandro Krug Wives ([@wives](https://github.com/wives) / [inf-ufrgs](https://github.com/inf-ufrgs)), com o auxílio do Google Gemini.

---

## 6. Licença

Este trabalho é distribuído sob a **LaTeX Project Public License (LPPL)** versão 1.3c ou posterior. Consulte os cabeçalhos dos arquivos para informações históricas de copyright do UTUG e colaboradores.
