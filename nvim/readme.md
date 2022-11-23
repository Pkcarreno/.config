# Comandos Vim

## Movimiento

- `h` -> izquierda
- `j` -> arriba
- `k` -> abajo
- `l` -> derecha
- `w` -> siguiente palabra (selecciona hasta primer carácter después de la palabra)
- `e` -> siguiente palabra (selecciona hasta ultimo carácter de la palabra)
- `b` -> palabra anterior
- `ctrl a` -> Seleccionar todo
- `$` -> final de la linea
- `0` -> principio de la linea
- `gg` -> primera linea
- `G` -> final del archivo
- `'num' G` -> salta a linea especifica
- `%` -> se mueve al siguiente paréntesis corchetes o llaves

## Modos

- `i` -> insertar
- `a` -> insertar final de cursor
- `esc + esc` -> regresar a modo normal
- `R` -> modo reemplazar
- `v` -> modo visual
- `shift V` -> modo visual lina

## Edición

- `x` -> cortar
- `p` -> pegar
- `y` -> copiar
- `u` -> deshacer (undo)
- `ctrl r` -> rehacer (redu)
- `dw` -> eliminar palabra
- `db` -> eliminar palabra anterior
- `d$` -> elimina texto de linea
- `d 'numero' 'operador de eliminacion ($, w, b)'` -> repite operador tantas veces numero colocado
- `dd` -> elimina linea (corta la linea y queda en clipboard)
- `dp` -> pega linea del clipboard debajo de linea del cursor
- `dP` -> pega linea del clipboard arriba de linea del cursor
- `ciw` -> elimina palabra y activa modo insertar para sustituir
- `/ 'texto'` -> busca dentro del texto
- `:s/texto a reemplazar/valor nuevo` -> reemplazar texto que coincida después del cursor por nuevo valor
- `:s/texto a reemplazar/valor nuevo/g` -> reemplazar todo el texto que coincida en la linea por nuevo valor
- `:%s/texto a reemplazar/valor nuevo/g` -> reemplazar todo el texto que coincida en el archivo por nuevo valor
- `o` -> nueva linea debajo del cursor
- `O` -> nueva linea arriba del cursor

## Ventanas

- `ss` -> divide terminal en horizontal
- `sv` -> divide terminal en vertical
- `s{h, j, k, l}` -> movimiento entre paneles
- `space` -> cambiar de panel
- `ctrl w {arriba, abajo, derecha, izquierda}` -> cambiar tamaño de panel

## Plugins

### bufferline

- `te` -> Nueva pestana
- `tab` -> siguiente pestana
- `shift tab` -> anterior pestana

### Telescope

- `;f` -> busca archivos
- `;f` -> grep (busca en los textos de todos los archivos)
- `\\` -> busca en el buffer de archivos abiertos
- `;t` -> etiquetas de ayuda
- `;;` -> Resumir (es como `sf` pero no entiendo la diferencia)
- `;e` -> diagnostico
- `sf` -> buscador desde la carpeta raíz

### Lspsaga

- `ctrl j` -> diagnostico
- `shift K` -> documentación sobre donde esta colocado el cursor
- `gd` -> buscador de referencia
- `ctrl k` -> ayuda de firma
- `gp` -> previsualizar definición
- `gr` -> renombrar

### Otros

`+` -> incrementar numero (posicionado el cursor sobre un numero)
`-` -> decrementar numero (posicionado el cursor sobre un numero)
