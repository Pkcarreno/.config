# Mi configuración

Esta es la configuración que uso en mis dispositivos y el propósito de este repo es poder integrarla fácilmente en cualquier sistema que use.

Por ahora se usa únicamente en Windows por lo que no tengo nociones de otros sistemas.

## Windows

### Instalaciones Previas

- Windows Terminal
- Powershell
- Scoop
  - nvm
    - node lts
  - sudo
  - Git
  - neovim
  - fzf

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

Descargar `plug.vim` manualmente y colocar en la ruta `~/AppData/Local/nvim-data/site/autoload`. (para esto extraer el raw directamente del repo en GitHub)

### Paso 5

Abrir terminal y ejecutar neovim. Una vez iniciado neovim ejecutar el comando `:PlugInstall` y reiniciar neovim (cerrar y volver abrir).

