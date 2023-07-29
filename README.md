Comprame un cafe! :-D [![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/S6S3NKLZ2)

# GeelyCoolray-AndroidAuto
Install Android Auto and Backbutton on Radio Geely Coolray version 05.07.06000.h50.00032

# DISCLAIMER
La licencia de este repositorio es GNU GPL, si no esta familiarizado con el OpenSource este Disclaimer es para aclarar puntos
1. El soporte de los software lo da la comunidad que mantiene este repositorio (Es publico cualquiera puede modificarlo)
2. En caso de fallas no puede culpar a este repositorio o a sus mantenedores ya que para eso esta esta documentacion
3. La instalacion de aplicaciones la hice como a mi me servia la comparto para que la usen como estimen conveniente
4. **Las pruebas, instalaciones y demas son realizadas bajo la responsabilidad de cada persona.**

# Pasos
1. Descargar este Repositorio, en la parte superior dice "Code/Codigo" ahi dentro se puede descargar el ZIP Completo
2. Formatear el pendrive en Formato "FAT32", esto es importante porque si no la radio no lee el USB
3. Descomprimir el ZIP
4. Copiar y Pegar todos los archivos dentro del Pendrive USB
   1. Modificacion de done.sh, si sumaste mas apk's
5. Una vez copiados, ir al Vehiculo
6. IMPORTANTE!!!!, Encender en ACC sin presionar el freno, solo que la radio encienda
7. IMPORTANTE!!!!, Enchufar el Pendrive USB en el puerto del lado del copiloto, si se hace en el otro hay que iniciar de nuevo todo el proceso (Me paso...)
8. Esperar que la radio Reinicie (3 Veces) e instale todo
9.  LISTO! a disfrutar de Android Auto!

## Video Explicativo
[![Apk's Geely Coolray](https://i9.ytimg.com/vi/v69KjKH5K_Q/mq1.jpg?sqp=CLiOwqQG-oaymwEmCMACELQB8quKqQMa8AEB-AHUBoAC4AOKAgwIABABGEMgRihlMA8%3D&rs=AOn4CLDGjhCVwRV7zYGM3OlYNFyLj1m8UA&retry=4)](https://youtu.be/v69KjKH5K_Q "Apk's Geely Coolray")

# NOTAS
- Es posible colocar mas APKS que quieras solo sumalas en el paso 4
- Yo aun estoy probando comop conectar Android Auto en modo Bluetooth, pero con cable funciona perfecto
- Si quieres Desinstalar es posible hacerlo, pero como recomendacion vuelve la radioa fabrica desde el menu de configuracion

# APKS Incluidos
- AA.apk: Android Auto.
- AutoKit.apk: Carplay.
- BackButton.apk: Boton volver atras para que aparezca siempre encima del todo en Android Auto necesario ya que se ejecuta en pantalla completa.
- homebutton.apk: Aplicacion para "mapear" botonnes y acciones de botones del volante, hasta el momento pude "mapear" el boton del volante que no tiene ningun icono para abrir Android Auto.


# Parte Tecnica (y Fome xD)
Los APKS son las aplicaciones que son posibles instalarlas en cualquier sistema Android Compatible, lo imporatante es saber que la app que estas instalando le sirva a tu sistema android en este caso la version 4 de Android es la que tiene nuestra radio.

El script que realiza el proceso es done.sh
```shell
#!/system/bin/sh
export PATH=/sbin:/system/sbin:/system/xbin:/system/bin
#Mount /system to overwrite
mount -o remount,rw /system /system

#Install apks
pm install -rtdg /mnt/udisk2/AA.apk
pm install -rtdg /mnt/udisk2/BackButton.apk

#End with reboot
sync
sleep 10
reboot
```
- Este script lo que realiza es invocar el paquete "pm" dentro de nuestro Android para realizar instalaciones de los apk.
- Los parametros "-rtdg" son para que no realice preguntas adicionales al momento de instalar y pase directo.
- La parte superior de nuestro script indica los paramtros de shell que deben estar para poder situarse en el sistema de ficheros de instalacion y montar el sistema en escritura para poder instalar.
- La parte final del script realiza el proceso de sincronizacion del disco y reinicio del sistema durmiendo 10 segundos antes de reiniciar.
- Dentro de los archivos existe un directorio "b832bc61472727635baffcf25dd28e9f239273e2" que contiene un archivo "d4ad0e797c738a44a9dd1b9231d201e8374dfda2.sh" estos 2 no es posible realizar el cambio de nombres ya que son identificadores que usa la radio para dar ejecucion de scripts, cuando se compra el "Carlink Kit" este viene con este directorio y archivo dentro.
```shell
#!/system/bin/sh
chmod +x /mnt/udisk2/done.sh

SCRIPT_PATH="/mnt/udisk2/done.sh"

. "$SCRIPT_PATH"
```
Solo realiza el proceso de dar permisos de ejecucion "chmod +x" al archivo done.sh para que sea ejecutable.
