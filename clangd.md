# Installazione di clangd su Windows

Questa guida ti mostrerà come risolvere i problemi di **clangd** su windows installando Mingw e LLVM. Dopo aver installato tutto nei requisiti eseguite il seguente comando:
```bash
clang++ --version
```

Dovresti avere un output simile a questo:

```bash
clang version 19.1.7
Target: x86_64-pc-windows-msvc
Thread model: posix
InstalledDir: D:\LLVM\bin
```

1. Specificare dove trovare le librerie

Quando installiamo clang su windows esso non arriva con gli header vari (come `iostream`, per questo vi ho fatto installare MinGW gcc come compilatore...) allora dobbiamo specificarli dove trovare le librerie. Per farlo creiamo nella root di clang (D:\LLVM\bin) un file chiamato `clang.cfg`, dentro mettiamo tutti i flag vari che vogliamo, tra essi mettiamo il -target che per esempio sarà -target x86_64-w64-mingw32. Una volta aver completato questi passaggi non ci dovrebbero essere più problemi, quando riapriamo un file cpp gli errorri dovrebbero essere risolti 😍
