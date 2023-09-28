Esta configuración esta inspirado en:
- [La configuración de Takuya](https://github.com/craftzdog/dotfiles-public)
- [Ecovim](https://github.com/ecosse3/nvim)
- Y, [algunas buenas practicas](https://dotfiles.github.io/utilities/)

## Contenido

- NeoVim config
- git config
- fish config
- PowerShell config

## Instalación previa

### Windows

Se requiere tener instalado [Scoop](https://scoop.sh/).

Ejecutar el siguiente comando para instalar todos los paquetes necesarios

```Powershell
  scoop install git peco nvm sudo neovim fzf tree-sitter ripgrep oh-my-posh gcc terminal-icons
```

### Linux

Instalar los siguientes paquetes:

```bash
  peco neovim fish eza
```

#### Fedora

Para poder instalar el paquete `peco` es necesario añadir el [repo de **RPM Sphere**](https://rpmsphere.github.io/)

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

En caso de usar **fish** este va a instalar `nvm`, la version lts de `node` y algunos paquetes de manera automática.

En caso de **no** tener **fish**, se requiere instalar `node` (preferible lts). A su vez, se debe ejecutar el siguiente comando `npm i -g commitizen`.

Esto ultimo es cierto en el caso de **Windows**.
