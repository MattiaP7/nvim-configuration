# Neovim Configuration per Windows

Questa è una configurazione per Neovim creata per la programmazione di linguaggi: C / C++, html/css/js, python, zig. Questo documento ti guiderà attraverso l'installazione e l'uso di questa configurazione.

## Pre requisiti

Prima di procedere, assicurati di avere i seguenti strumenti installati:

- **<a target="_blank" href="https://neovim.io/">Neovim</a>**: Assicurati di avere l'ultima versione di Neovim installata. Puoi verificarlo eseguendo `nvim --version` nel terminale.
- **<a target="_blank" href="https://git-scm.com/">Git</a>**: Per clonare il repository.
- **<a href="https://github.com/ryanoasis/nerd-fonts/releases" target="_blank">Nerd Font</a>**: Come font del terminale.
  - Assicurarsi che il nome del font non termini con "Mono" altrimenti le icone saranno piccole.
- **<a href="https://nodejs.org/en" target="_blank">Nodejs</a>**: Per il supporto ai plugin che richiedono Node.js.
- **<a target="_blank" href="https://github.com/BurntSushi/ripgrep">Ripgrep</a>** per la ricerca "grep" con Telescope.
- Make, **<a href="https://sourceforge.net/projects/gnuwin32" target="_blank">GnuWin32</a>** installato e settato on path.
- GCC, bisogna avere **<a target="_blank" href="https://www.msys2.org">Mingw</a>** installato e settato on path.
- Zig, per installarlo andare su **<a target="_blank" href="https://ziglang.org/learn/getting-started/#installing-zig">ZigLang</a>**

## Installazione:

Segui questi passaggi per installare e configurare Neovim con questa configurazione:

1. **Clona la Repository**

   Apri il terminale e clona la repository:

   - cmd

   ```bash
   git clone https://github.com/MattiaP7/nvim-configuration %USERPROFILE%\AppData\Local\nvim
   ```

   - Powershell

   ```bash
   git clone https://github.com/MattiaP7/nvim-configuration $env:LOCALAPPDATA\nvim
   ```

   ricorda di eliminare la cartella `.git`.

<details>

<summary>la struttura quindi della cartella `~/AppData/Local/nvim`</summary>

```
~/AppData/Local/nvim
│   init.lua
│   lazy-lock.json
│   README.md
│
└───lua
    │   .luarc.json
    │   options.lua
    │   plugins.lua
    │
    └───plugins
        │   (tutti i plugins qui dentro)
        │
        └───lsp
            │   lspconfig.lua
            │   mason.lua
            │
            └───language
                    (ogni config per i linguaggi qua dentro)
```

</details>
<br />

3. **Installare i plugin**

   Spostarsi nella cartella `~/AppData/Local/nvim` eseguire il comando:

   ```bash
    nvim
   ```

automaticamente dovrebbero partire i download dei plugin, per verificare il download di essi dentro nvim eseguire il comando (in normal mode): `:Lazy`, questo aprirà la ui di lazy.

> [!CAUTION]
> è possibile che è i plugin non si installino tutti la prima volta, in caso chiudere lazy con `:q` e riaprire nvim e richiamare lazy, fallo finchè tutto non sarà installato.

> [!WARNING]
> ricorda che per installare vim-doge, devi eseguire il comando: `:call doge#install()`

> [!CAUTION]
> Neovim come lsp per c++ utilizza "clangd". Se hai problemi con clangd, per esempio non trova gli header come "iostream", vai alla pagina guida [clangd](clangd.md) 4. **Lsp e Mason**

- documentazione **<a href="https://github.com/williamboman/mason.nvim" target="_blank">Mason</a>**
- documentazione **<a href="https://github.com/williamboman/mason-lspconfig.nvim" target="_blank">Mason-lspconfig</a>**
- documentazione **<a target="_blank" href="https://github.com/neovim/nvim-lspconfig">nvim-lspconfig</a>**

Di default vengono installati vari language server, formatter, linter, ... per lo sviluppo di linguaggi come: C/C++, python, lua, zig, html, css/tailwind, js/ts/jsx/tsx...

Per installare i language, linter, formatter... di mason, eseguire (in normal mode): `:Mason` questo aprirà la sui ui e con ctrl+f potrete scrivere il vostro linguaggio e vi usciranno i pacchetti consigliati, una volta trovato quello giusto usando "I".

Per installare un language server per LSP eseguire (in normal mode): `:LspInstall <linguaggio>`.
Una volta installato il linguaggio creare nella cartella language/ un file con "linguaggio.lua", creare la configurazione, aggiungere il nome del file creato nella tabella "languages" contenuta nel file lspconfig.lua, la configurazione farà il resto.

## Keymaps

In questa configurazione sono stati creati dei keymaps per velocizzare il richiamo delle funzioni, in seguito troverai una tabella con: keymaps | descrizione.

> [!WARNING]
> (tutti i keymaps sono eseguibili solo in normal mode). nota che "< leader >" nella mia configurazione è lo spazio. quando per esempio trovi "< leader >f" significa "spazio + f", "< C-f>" significa "ctrl+f". (devo fare degli spazi fra le < perche' markdown non capisce altrimenti...).

| Keymaps     |                Descrizione                |
| :---------- | :---------------------------------------: |
| leader + mp |             Formatta il file              |
| Ctrl + n    | Apre il file system di neotree a sinistra |
| Ctrl + p    |      Apre il trova file di telescope      |
| Ctrl + fg   |      Apre il live grep di telescope       |
| Ctrl + f    |     Apre il trova parole di telescope     |
| Ctrl + f    |     Apre il trova parole di telescope     |
| leader + th |             Apre il terminale             |
| leader + ca |       Apre il 'code action' di LSP        |

<h4>SPECIALI PER LSP</h4>

per queste bisogna trovarsi sopra il nome di una funzione.

| Keymaps |       Descrizione        |
| :------ | :----------------------: |
| gD      |  Vai alla dichiarazione  |
| gd      |   Vai alla definizione   |
| gi      | Vai alla implementazione |
