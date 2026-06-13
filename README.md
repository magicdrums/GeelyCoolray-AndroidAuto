Comprame un cafe! :-D [![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/S6S3NKLZ2)

# GeelyCoolray-AndroidAuto

Paquete de instalación automática de **Android Auto** y utilidades para la radio del **Geely Coolray** (firmware `05.07.06000.h50.00032`, Android 4).

---

## ¿Qué hace este repositorio?

Copias el contenido de este repo en un pendrive USB y la radio lo detecta al encender. Un script interno de la radio ejecuta `done.sh`, que instala las aplicaciones y reinicia el sistema. No hace falta root manual ni ADB.

La app principal para Android Auto es **[Headunit Revived](https://github.com/andreknieriem/headunit-revived)** (v2.3.1), emulador open source de receptor Android Auto compatible con Android 4.1+.

---

## Requisitos

- Geely Coolray con la radio en firmware `05.07.06000.h50.00032` (o compatible con el Carlink Kit).
- Pendrive USB formateado en **FAT32**.
- Cable USB del teléfono para Android Auto (modo cable probado; Bluetooth aún en pruebas).

---

## Instalación paso a paso

### 1. Descargar el repositorio

En GitHub, pulsa **Code → Download ZIP** y descomprime el archivo en tu PC.

### 2. Preparar el pendrive

1. Formatea el pendrive en **FAT32**. Si usas otro formato, la radio puede no leerlo.
2. Copia **todos** los archivos y carpetas del ZIP a la **raíz** del pendrive, incluyendo:
   - Los archivos `.apk`
   - `done.sh`
   - La carpeta `b832bc61472727635baffcf25dd28e9f239273e2/` (no renombres nada dentro)

La estructura en el pendrive debe verse así:

```
USB (FAT32)/
├── done.sh
├── headunitrevived231.apk
├── WifiManager.apk
├── Carplay.apk
├── AutoKit.apk
├── BackButton.apk
├── homebutton.apk
├── droidinfo.apk
└── b832bc61472727635baffcf25dd28e9f239273e2/
    └── d4ad0e797c738a44a9dd1b9231d201e8374dfda2.sh
```

### 3. Instalar en el vehículo

1. **Enciende la radio en ACC** (contacto sin pisar el freno; solo que la pantalla encienda).
2. **Conecta el pendrive en el puerto USB del copiloto.** Si lo conectas en el otro puerto, puede que no funcione y tengas que repetir todo el proceso.
3. Espera a que la radio **reinicie unas 3 veces** mientras instala las apps.
4. Listo. Abre Headunit Revived y conecta tu teléfono por cable.

### 4. (Opcional) Añadir más APKs

Si quieres instalar apps extra:

1. Copia el `.apk` al pendrive.
2. Edita `done.sh` y añade una línea como esta por cada app nueva:

```shell
pm install -rtdg /mnt/udisk2/TuApp.apk
```

---

## Video explicativo

[![Apk's Geely Coolray](https://i9.ytimg.com/vi/v69KjKH5K_Q/mq1.jpg?sqp=CLiOwqQG-oaymwEmCMACELQB8quKqQMa8AEB-AHUBoAC4AOKAgwIABABGEMgRihlMA8%3D&rs=AOn4CLDGjhCVwRV7zYGM3OlYNFyLj1m8UA&retry=4)](https://youtu.be/v69KjKH5K_Q "Apk's Geely Coolray")

---

## Aplicaciones incluidas

| APK | Descripción |
|-----|-------------|
| `headunitrevived231.apk` | **Headunit Revived v2.3.1** — emulador de Android Auto en la radio. App principal del paquete. |
| `WifiManager.apk` | Gestión de WiFi en la radio. |
| `Carplay.apk` | Conexión con iPhone (CarPlay). |
| `AutoKit.apk` | Conexión con iPhone vía dongle (no probada). |
| `BackButton.apk` | Botón "Atrás" flotante sobre Android Auto (pantalla completa). |
| `homebutton.apk` | Mapeo de botones del volante; permite asignar un botón para abrir Android Auto. |
| `droidinfo.apk` | Información del sistema Android de la radio. |

---

## Notas

- Android Auto por **cable USB** funciona correctamente. El modo **Bluetooth** aún está en pruebas.
- Para **desinstalar**, lo más seguro es restaurar la radio a **ajustes de fábrica** desde el menú de configuración.
- La radio usa **Android 4**; solo instala APKs compatibles con esa versión.

---

## Agradecimientos

Este paquete usa **[Headunit Revived](https://github.com/andreknieriem/headunit-revived)**, desarrollado y mantenido por **[André Knieriem](https://github.com/andreknieriem)** ([@andreknieriem](https://github.com/andreknieriem)).

Headunit Revived es una continuación open source del proyecto original de **Michael Reid** ([headunit](https://github.com/mikereidis/headunit)), modernizado para soportar Android Auto por cable e inalámbrico, con mejor compatibilidad en head units antiguos.

Si te resulta útil, considera apoyar al proyecto:

- ⭐ [GitHub — headunit-revived](https://github.com/andreknieriem/headunit-revived)
- 🌐 [Sitio web del proyecto](https://headunit.andrerinas.com/)
- 📱 [Google Play Store](https://play.google.com/store/apps/details?id=com.andrerinas.headunitrevived)

---

## Licencia

Este repositorio se distribuye bajo la **[GNU General Public License v3.0 o posterior](https://www.gnu.org/licenses/gpl-3.0.html)** (GPL-3.0-or-later).

El texto completo de la licencia está en el archivo [`LICENSE`](LICENSE). Es la versión más reciente de la GPL publicada por la Free Software Foundation (29 de junio de 2007); no existe una GPL v4.

---

## DISCLAIMER

La licencia de este repositorio es **GNU GPL v3.0 o posterior** (ver [`LICENSE`](LICENSE)). Si no estás familiarizado con el software libre, ten en cuenta lo siguiente:

1. El soporte lo da la comunidad que mantiene este repositorio (es público; cualquiera puede modificarlo).
2. En caso de fallas no puedes responsabilizar a este repositorio ni a sus mantenedores; para eso está esta documentación.
3. La selección de aplicaciones refleja lo que me funcionó; compártelo y úsalo bajo tu propio criterio.
4. **Las pruebas, instalaciones y demás acciones son bajo tu propia responsabilidad.**

---

## Parte técnica

Los APKs son aplicaciones Android normales. Lo importante es que sean compatibles con **Android 4**, que es la versión de nuestra radio.

### Script de instalación (`done.sh`)

```shell
#!/system/bin/sh
export PATH=/sbin:/system/sbin:/system/xbin:/system/bin
#Mount /system to overwrite
mount -o remount,rw /system /system

#Install apks
pm install -rtdg /mnt/udisk2/headunitrevived231.apk
pm install -rtdg /mnt/udisk2/WifiManager.apk
pm install -rtdg /mnt/udisk2/Carplay.apk
pm install -rtdg /mnt/udisk2/AutoKit.apk
pm install -rtdg /mnt/udisk2/BackButton.apk
pm install -rtdg /mnt/udisk2/homebutton.apk
pm install -rtdg /mnt/udisk2/droidinfo.apk

#End with reboot
sync
reboot
```

- **`pm install -rtdg`**: instala cada APK sin preguntas adicionales (`-r` reinstala, `-t` permite apps de prueba, `-d` permite downgrade, `-g` concede permisos).
- **`mount -o remount,rw`**: monta `/system` en lectura/escritura para poder instalar.
- **`sync` + `reboot`**: sincroniza el disco y reinicia la radio al terminar.

### Script de arranque de la radio

La carpeta `b832bc61472727635baffcf25dd28e9f239273e2/` y el archivo `d4ad0e797c738a44a9dd1b9231d201e8374dfda2.sh` **no deben renombrarse**. Son identificadores que la radio usa para ejecutar scripts automáticamente (vienen con el Carlink Kit):

```shell
#!/system/bin/sh
chmod +x /mnt/udisk2/done.sh

SCRIPT_PATH="/mnt/udisk2/done.sh"

. "$SCRIPT_PATH"
```

Este script solo da permisos de ejecución a `done.sh` y lo invoca.
