# Installazione di clangd su Windows

Questa guida ti mostrerà come risolvere i problemi di **clangd** su windows installando Mingw tramite MSYS2 e LLVM.

1. Installazione di Mingw tramite MSYS2

Prima di tutto assicurati di avere installato Mingw e di averlo impostato nelle variabili di ambiente. Ecco la guida [MSYS2](https://www.msys2.org/)

2. Installazione di LLVM

successivamente, dovrai installare LLVM. Io l'ho installato tramite [scoop](https://scoop.sh/):

```bash
scoop install llvm
```

Oppure, puoi scaricarlo dal sito ufficiale [LLVM Releases](https://releases.llvm.org/)

3. Verifica dell'installazione di clang++
   Una volta installato LLVM, apri il terminale e verifica l'installazione di **clang++** con il seguente comando:

```bash
clang++ --version
```

Dovresti avere un output simile a questo:

```bash
clang version 18.1.8
Target: x86_64-pc-windows-msvc
Thread model: posix
InstalledDir: C:\Users\<username>\scoop\apps\llvm\current\bin
```

4. Configurazione dei file include

Per risolvere eventuali problemi come non trovare gli header segui questi passaggi:

- Vai nella cartella di installazione di MSYS2, ad esempio: `C:\msys64\ucrt64`
- Copia la cartella `include` presente in quella directory
- Incolla la cartella `include` nella directory di LLVM: `C:\Users\<username>\scoop\apps\llvm\current\bin` Sostituendo quella esistente.

Questi passaggi dovrebbero risolvere gli eventuali problemi.
