Esta configuración esta inspirado en:

- [La configuración de Takuya](https://github.com/craftzdog/dotfiles-public)
- [la configuración de Chris Titus](https://github.com/ChrisTitusTech/powershell-profile)
- [LazyVim](https://www.lazyvim.org/)
- Y, [algunas buenas practicas](https://dotfiles.github.io/utilities/)

## Contenido

- NeoVim config
- git config
- fish config
- PowerShell config
- tmux config

## Instalación previa

### Windows

Se requiere tener instalado [Scoop](https://scoop.sh/).

Ejecutar el siguiente comando para instalar todos los paquetes necesarios

```Powershell
  scoop install git peco nvm sudo neovim gzip bat tree-sitter fd ripgrep gcc
```

### Linux

Instalar los siguientes paquetes:

```bash
  peco neovim fish tmux eza fd bat ripgrep
```

nota: _recomendado usar homebrew_

## Setup

1. Ejecutar `git clone` de este proyecto dentro de la carpeta raiz (`~/`).
2. Mover los archivos dentro de la carpeta `dotfiles` a la raiz. _(Si existe una carpeta `.config` en la raiz, entonces mover manualmente los archivos dentro de `dotfiles/.config` a `.config`)_
3. Ejecutar los pasos post setup.

## Post Setup

### Fish

Ejecutar el siguiente script para instalar el gestor de plugins de fish (fisher) e instalar los plugins del proyecto. _[Tomado de este comentario](https://github.com/jorgebucaran/fisher/issues/775#issuecomment-1703684632)_

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
```

### Node

En caso de usar **fish** este va a instalar `nvm`, en el caso de usar **windows** se instalara `nvm` al ejecutar el comando de scoop.

Cuando se tenga nvm se debe instalar la version lts de node, y, posteriormente, se debe ejecutar el siguiente comando `npm i -g czg`. En el caso de usar **fish** debe instalar una version de node mediante **nvm**, este instalara los paquetes necesarios automaticamente gracias al parametro [$nvm_default_packages](https://github.com/jorgebucaran/nvm.fish#nvm_default_packages)
