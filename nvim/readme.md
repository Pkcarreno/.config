# Comandos Vim

## Movimiento

- `h` -> izquierda
- `j` -> arriba
- `k` -> abajo
- `l` -> derecha
- `w` -> siguiente palabra
- `b` -> palabra anterior
- `ctrl A` -> final de linea
- `$` -> final de la linea
- `0` -> principio de la linea
- `gg` -> principio del archivo
- `G` -> final del archivo
- `'num' G` -> salta a linea especifica
- `%` -> se mueve al siguiente paréntesis corchetes o llaves

## Modos

- `i` -> insertar
- `a` -> insertar final de cursor
- `ctrl a` -> insertar a final de linea
- `esc + esc` -> regresar a modo normal
- `R` -> modo reemplazar
- `v` -> modo visual

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
- `:s/texto a reemplazar/valor nuevo` -> reemplazar texto que coincida despues del cursor por nuevo valor
- `:s/texto a reemplazar/valor nuevo/g` -> reemplazar todo el texto que coincida en la linea por nuevo valor
- `:%s/texto a reemplazar/valor nuevo/g` -> reemplazar todo el texto que coincida en el archivo por nuevo valor
- `o` -> nueva linea debajo del cursor
- `O` -> nueva linea arriba del cursor

## Plugins

- `space nt` -> abre nerdttree
- `space s` -> inserta 2 letras y busca texto para saltar el cursor alli
- `space w` -> guarda
- `space q` -> salir
- `ctrl h,j,k,l` -> mover terminales de tmux
