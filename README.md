# Optimización de una serie de cálculos matemáticos con lenguaje ensamblador DLX

![Inicio](https://github.com/rmelgo/ARQ-Optimizacion-ensamblador-DLX/assets/145989723/a63b9f08-7b22-480f-8272-f436c7f1634b)

# - Introducción

Proyecto realizado en la asignatura de ***Arquitectura de Computadores*** del grado de Ingenieria Informática de la Universidad de Salamanca. El enunciado del proyecto se encuentra subido en el repositorio en un archivo PDF llamado <a href="https://github.com/rmelgo/ARQ-Optimizacion-ensamblador-DLX/blob/main/Enunciado.pdf" target="_blank">*Enunciado.pdf*</a>.
  
El principal objetivo de este proyecto es la realización de un programa en lenguaje ensamblador que realice una serie de cálculos matemáticos, de la manera más eficiente posible, utilizando el menor número de ciclos de reloj posibles.
Por tanto, el propósito fundamental es utilizar disintas técnicas optimización y paralelización para reducir al máximo posible los ciclos de reloj necesarios para hacer los cálculos matemáticos de manera correcta.

Para poner de manifiesto la diferencia de rendimiento que proporciona la optimización, se realizará primeramente una versión del programa sin optimizar que realice los calculos matemáticos y después se realizará la versión optimizada del mismo.

# - Comentarios sobre el entorno de ejecución

Para ejecutar este programa, se necesitará la herramienta **WINDLX**.    

Para poder ejecutar la herramienta **WINDLX** en Windows, deben seguirse los siguientes pasos:

- **Paso 1**: Descargar la aplicación de *WINDLX*. Para ello, se debe acceder al siguiente enlace:

http://electro.fisica.unlp.edu.ar/arq/downloads/Software/WinDLX/windlx.html

- **Paso 2**: Descargar *OTVDM*, el cual se trata de una herramienta que permite ejecutar aplicaciones de 16 bits en entornos de 64 bit. Esto es necesario ya que *WINDLX* es una aplicación de 16 bits. Para ello, se debe acceder al siguiente enlace:

https://github.com/otya128/winevdm/releases

- **Paso 3**: Instalar *OTVDM*. Para ello, se debe descomprimir la carpeta y ejecutar el ejecutable *install*:
- **Paso 4**: Ejecutar *WINDLX*. Para ello, se deben presionar las teclas "Windows + R". Al hacer esto, se desplegará una ventana donde se introducirá la ruta donde se encuentra el fichero ejecutable *WINDLX.EXE*.

![ejecución](https://github.com/rmelgo/ARQ-Optimizacion-ensamblador-DLX/assets/145989723/ddeb6249-cc9f-42b0-a2b0-df128ae803d4)

# Comentarios sobre el material adjuntado

El proyecto cuenta con los siguientes ficheros:

- Un fichero llamado ***Trabajo_DLX_No_Optimizado.S*** que contiene el código en ensamblador necesario para realizar los cálculos matemáticos pedidos de manera no optimizada.
- Un fichero llamado ***Trabajo_DLX_Optimizado_Comentado.S*** que contiene el código en ensamblador necesario para realizar los cálculos matemáticos pedidos de manera optimizada.
- Un documento llamado ***informe_DLX.pdf*** que contiene una explicación de las mejoras introducidas para la optimización del los cálculos matemáticos así como una comparativa de resultado entre la versión optimizada y la versión no optimizada.
  
# - Pasos necesarios para ejecutar el programa

**Paso 1: Cargar el programa**  

Para cargar un programa en *WINDLX*, se debe pulsar *F3*. Tras realizar esto, se desplegará la siguiente ventana:

![Carga](https://github.com/rmelgo/ARQ-Optimizacion-ensamblador-DLX/assets/145989723/a992198e-8a1a-4939-8f33-9213195697ba)

El usuario debe primero seleccionar el fichero correspondiente y posteriormente cargarlo en el programa.
Es imprescindible que el fichero que se desea cargar se encuentre en la misma carpeta donde se encuentra el ejecutable *WINDLX.EXE*.

**Paso 2: Ejecutar el programa**  

Para ello, se debe pulsar la tecla *F5*. 
También es posible ejecutar ciclo a ciclo pulsando *F4*.

**Paso 3: Resultados**

Cuando se haya ejecutado la totalidad del programa, los resultados de los cálculos matemáticos estarán correctamente almacenados en las variables correspondientes (ver enunciado).

En la sección de estadísticas, se puede observar las instrucciones ejecutadas, los ciclos utilizados y las distintas paradas que se han producido así como los distintos tipos de instrucciones utilizadas.

En la sección de diagramas, se puede observar de manera gráfica cada una de las intrucciones ejecutadas, su duración y el ciclo de reloj en el que se han producido.

![Resultados](https://github.com/rmelgo/ARQ-Optimizacion-ensamblador-DLX/assets/145989723/43343181-8346-4bbb-9059-dd92d6771251)

# - Ejemplos de ejecución

## Ejecución de la versión no optimizada

En la siguiente imagen, se muestra un ejemplo de ejecución utilizando la versión no optimizada:    

![Ejemplo ejecucion 1](https://github.com/rmelgo/ARQ-Optimizacion-ensamblador-DLX/assets/145989723/0188a37b-5f15-4cdc-9b72-8ef45a7cea0d)

Como se puede observar, se ejecutan 368 instrucciones y se requiere de 754 ciclos de reloj para realizar el cálculo.

## Ejecución de la versión optimizada

En la siguiente imagen, se muestra un ejemplo de ejecución utilizando la versión optimizada:    

![Ejemplo ejecucion 2](https://github.com/rmelgo/ARQ-Optimizacion-ensamblador-DLX/assets/145989723/4949df21-389c-4ca0-9af6-44359f09b6b9)

Como se puede observar, se ejecutan 300 instrucciones y se requiere de 315 ciclos de reloj para realizar el cálculo.

## Resultados y conclusiones

De esta manera, se puede ver como la versión optimizada requiere menos de la mitad de ciclos que la versión no optimizada.

Observese como el número de ciclos de reloj es muy próximo al número de instrucciones ejecutadas en la versión optimizada mientras en la versión no optimizada esto no ocurre.

También se puede observar una disminución del número de instrucciones ejecutadas en la versión optimizada con respecto a la versión no optimizada.

**Nota**: Es posible editar las variables de entrada tal como se dice en el enunciado, lo que producira resultados distintos.

# - Participantes

<table>
  <td align="center"><a href="https://github.com/rmelgo"><img src="https://avatars.githubusercontent.com/u/145989723?s=400&u=e5c06adba3f3c418207178abc845d398b3d5f77f&v=4" width="100px;" alt=""/><br /><sub><b>Raúl Melgosa</b></sub></a><br/> 
  <td align="center"><img src="https://avatars.githubusercontent.com/u/84237179?v=4" width="100px;" alt=""/><br /><sub><b>Alberto Lorenzo</b></sub></a><br/> 
</table>
