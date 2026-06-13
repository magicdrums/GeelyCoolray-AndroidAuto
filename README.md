Comprame un cafe! :-D [![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/S6S3NKLZ2)

# GeelyCoolray-AndroidAuto

Paquete de instalación automática de **Android Auto** y utilidades para la radio del **Geely Coolray** (firmware `05.07.06000.h50.00032`, Android 4).

---

## ¿Qué hace este repositorio?

Copias el contenido de este repo en un pendrive USB y la radio lo detecta al encender. Un script interno de la radio ejecuta `done.sh`, que instala las aplicaciones y reinicia el sistema. No hace falta root manual ni ADB.

La app principal para **Android Auto** (teléfonos Android) es **[Headunit Revived](https://github.com/andreknieriem/headunit-revived)** (v2.3.1).

Para **iPhone / Apple CarPlay**, la app correcta es **AutoKit** de Carlinkit (`AutoKit.apk`), que requiere un dongle USB adicional (ver sección [iPhone y CarPlay](#iphone-y-carplay)).

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
| `headunitrevived231.apk` | **Headunit Revived v2.3.1** — Android Auto para teléfonos **Android** (por cable). |
| `WifiManager.apk` | Gestión de WiFi en la radio (necesario para actualizar AutoKit). |
| `AutoKit.apk` | **Carlinkit AutoKit** — Apple CarPlay para **iPhone**. Requiere dongle CCPW/CCPA (ver abajo). |
| `BackButton.apk` | Botón "Atrás" flotante sobre Android Auto (pantalla completa). |
| `homebutton.apk` | Mapeo de botones del volante; permite asignar un botón para abrir Android Auto. |
| `droidinfo.apk` | Información del sistema Android de la radio. |

---

## iPhone y CarPlay

### ¿Qué app usar?

| App | ¿Sirve para iPhone? | Notas |
|-----|---------------------|-------|
| **`AutoKit.apk`** | **Sí** | App oficial de Carlinkit. Es la solución usada en la comunidad del Coolray. |
| `headunitrevived231.apk` | No | Solo Android Auto (teléfonos Android). |
| ~~`Carplay.apk`~~ | **No** | Era `com.oslotech.applecar`: una app de terceros con nombre engañoso, **no** implementa CarPlay. Fue eliminada del paquete. |

### Hardware necesario (obligatorio)

AutoKit **no funciona solo con el cable del iPhone**. Necesitas un dongle **Carlinkit** compatible:

| Dongle | ¿Funciona? |
|--------|------------|
| **CCPW** (wireless) | Sí — el más usado en Coolray |
| **CCPA** (wireless) | Sí |
| CP2A, TBox, AI Box Android 13 | **No** con AutoKit en Coolray pre-facelift |

Puedes comprarlo en AliExpress, Amazon o tiendas locales. Busca modelos **CCPW** o **CCPA** para pantallas Android aftermarket.

### Versión de AutoKit incluida

El `AutoKit.apk` del repo (~9,6 MB) corresponde a la versión oficial **`2025.03.19.1126`**, que es la más reciente publicada por Carlinkit al momento de armar este paquete. Descarga alternativa: [Carlinkit — AutoKit](https://cn.carlinkit.com/download_back.html).

### Configuración recomendada (iPhone)

1. Instala el paquete con el pendrive (como en la sección de instalación).
2. Conecta la radio a **WiFi** con WifiManager (AutoKit puede pedir actualizarse).
3. Abre **AutoKit** en la radio y completa la prueba de entorno si la muestra.
4. En el iPhone: activa **Siri** (Ajustes → Siri).
5. Inserta el dongle Carlinkit en el **puerto USB del conductor** (no el del pendrive de instalación).
6. Conexión:
   - **Con cable:** iPhone → dongle → USB del coche.
   - **Inalámbrica:** empareja el Bluetooth del iPhone con la señal **AutoKit** del dongle.

### Referencias de la comunidad

- [Guía XDA — AutoKit en Geely Coolray](https://xdaforums.com/t/guide-how-to-install-autokit-and-get-carplay-on-geely-coolray.4546127/)
- [Telegram — Geely CarPlay SA](https://t.me/GeelyCarplaySA)
- [FAQ oficial AutoKit (Carlinkit)](https://carlinkitcarplay.com/pages/faq-en-autokit-for-aftermarket-android-screen-cars-version1-0)

---

## Notas

- **Android (Google):** Headunit Revived por **cable USB** funciona correctamente. Bluetooth aún en pruebas.
- **iPhone (Apple):** CarPlay vía **AutoKit + dongle Carlinkit CCPW/CCPA**. Sin dongle no hay CarPlay nativo en esta radio.
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
