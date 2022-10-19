# Mi configuración

Esta es la configuración que uso en mis dispositivos y el propósito de este repo es poder integrarla fácilmente en cualquier sistema que use.

Por ahora se usa únicamente en Windows por lo que no tengo nociones de otros sistemas.

## Windows

### Instalaciones Previas

- Windows Terminal
- Powershell 7 o Superior
- Scoop
  - nvm
    - node lts
  - sudo
  - git
  - neovim
  - fzf
  - tree-sitter
  - ripgrep
  - oh-my-posh
  - lua-language-server

Ejecutar el siguiente comando para instalar todos los paquetes de scoop

```Powershell
  scoop install git nvm sudo neovim fzf tree-sitter ripgrep oh-my-posh lua-language-server
```

### Paso 1

Hacer `git clone` de este repo en dirección raíz. (Al instalar Scoop este crea una carpeta `.config` en la dirección raíz, en dado caso que Git de conflicto porque la ruta ya existe, eliminar esta carpeta. El Git ignora la carpeta generada por Scoop)

### Paso 2

Abrir Windows terminal con la versión instalada de Powershell. Este instalara todos los paquetes que estén en el archivo de configuración. (podría tomar un tiempo el primer arranque)

### Paso 3

Crear un archivo `init.vim` en la ruta `~/AppData/Local/nvim` que contenga:

```vim
set runtimepath^=~\.config\nvim runtimepath+=~\.config\nvim\after
let $packpath=&runtimepath
source ~\.config\nvim\init.vim
```

### Paso 4

Instalar Vim Packer

### Paso 5

Abrir terminal y ejecutar neovim. Una vez iniciado neovim ejecutar el comando `:PackerInstall` y reiniciar neovim (cerrar y volver abrir).

