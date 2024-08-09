# Neovim Configuration per Windows

Questa è una configurazione per Neovim che ho creato per migliorare la mia esperienza di programmatore. Questo documento ti guiderà attraverso l'installazione e l'uso di questa configurazione.

In questa configurazione troverai:
   * Dashboard
   * Tabs
   * Catppuccin (colorscheme)
   * Completitions & Snippet plugin
   * Neovim statusline
   * Neotree for file system
   * Autoclose brackets plugin
   * Find, Filter, Preview, Pick.
   * syntax highlighting

## Pre requisiti

Prima di procedere, assicurati di avere i seguenti strumenti installati:

- **[Neovim](https://neovim.io/)**: Assicurati di avere l'ultima versione di Neovim installata. Puoi verificarlo eseguendo `nvim --version` nel terminale.
- **[Git](https://git-scm.com/)**: Per clonare il repository.
- **[Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases)**: Per mostrare le icone dei file
- **[Nodejs](https://nodejs.org/en)**: Per il supporto ai plugin che richiedono Node.js.

## Installazione: 

Segui questi passaggi per installare e configurare Neovim con questa configurazione:

1. **Clona la Repository**

   Apri il terminale e clona la repository:
   ```bash
   git clone https://github.com/MattiaP7/nvim-configuration $env:LOCALAPPDATA\nvim
   ```
   la struttura quindi della cartella `~/AppData/Local/nvim` deve essere:
   ```
   ~/AppData/Local/nvim
   │   .luarc.json
   │   init.lua
   │   lazy-lock.json
   │   README.md
   │   
   └───lua
      │   plugins.lua
      │   vim-opts.lua
      │   
      └───plugins
               alpha.lua
               barbar-nvim.lua
               catppuccin.lua
               completitions.lua
               lsp-config.lua
               lualine.lua
               neo-tree.lua
               none-ls.lua
               nvim-autopairs.lua
               telescope.lua
               treesitter.lua
   ```

2. **Installare i plugin**

   Spostarsi nella cartella `~/AppData/Local/nvim` eseguire il comando:
   ```bash
   nvim
   ```
   automaticamente dovrebbero partire i download dei plugin, per verificare il download di essi dentro nvim eseguire il comando (in normal mode): `:Lazy`, questo aprirà la ui di lazy.
3. **LSP e Mason**
   - documentazione **[Mason](https://github.com/williamboman/mason.nvim)**
   - documentazione **[Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)**
   - documentazione **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**

   Per installare i language, linter, formatter... di mason, eseguire (in normal mode): `:Mason` questo aprirà la sui ui e con ctrl+f potrete scrivere il vostro linguaggio e vi usciranno i pacchetti consigliati.

   Per installarne uno poi eseguire (in normal mode): `:MasonInstall clangd` (per c++) 


   Per installare un language server per LSP eseguire (in normal mode): `:LspInstall <linguaggio>` 

