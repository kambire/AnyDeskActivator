# 🧰 AnydeskActivator1.1

Un script en `.bat` para Windows que elimina automáticamente el archivo `service.conf` de AnyDesk, con opciones en menú visual sencillo y posibilidad de habilitar eliminación automática en cada reinicio del sistema.

---

## 📝 Descripción

Este script funciona con interfaz de línea de comandos básica y permite:

- Eliminar manualmente `service.conf`.
- Reiniciar el servicio **AnyDesk**.
- Verificar si AnyDesk está instalado.
- Activar eliminación automática del archivo **service.conf** en cada reinicio del sistema mediante tarea programada con privilegios elevados.

---

## ⚙️ Tabla de Contenidos

- [Instalación](#instalación)  
- [Uso](#uso)  
- [Menú disponible](#menú-disponible)  
- [Activando eliminación automática](#activando-eliminación-automática)  
- [Requisitos](#requisitos)  
- [Planes futuros](#planes-futuros)  
- [Contribuciones y sugerencias](#contribuciones-y-sugerencias)  
- [Licencia](#licencia)  

---

## 🔧 Instalación

1. Clona el repositorio o descarga el archivo `AnydeskActivator1.1.bat`.
2. Colócalo en la carpeta deseada (e.g. `C:\Scripts\`).
3. Ejecuta haciendo doble clic o desde PowerShell/CMD.

---

## 🚀 Uso

Al ejecutar como administrador (o al confirmarse la elevación automática), verás el siguiente menú:

============== AnydeskActivator1.1 ===============

    Eliminar archivo service.conf

    Reiniciar servicio AnyDesk

    Verificar instalación de AnyDesk

    Activar eliminación en cada reinicio

    Salir
    ===================================================


Ingresa el número de opción para realizar la acción correspondiente.

---

## 🧩 Menú disponible

- **Opción 1**: Detiene AnyDesk y elimina el archivo `service.conf`.  
- **Opción 2**: Reinicia el servicio de AnyDesk.  
- **Opción 3**: Comprueba si AnyDesk está instalado en `C:\Program Files\AnyDesk`.  
- **Opción 4**: Crea una tarea programada (**schtasks**) llamada `AnydeskActivator1.1_DeleteServiceConf` que ejecuta el script al iniciar Windows con privilegios elevados y automáticamente elimina `service.conf`.  
- **Opción 5**: Cierra el script.

---

## 🛠️ Activando eliminación automática

Al elegir la **opción 4**, el script:

- Crea una tarea en el **Programador de tareas** usando `schtasks /SC ONSTART /RL HIGHEST /F`.
- Ejecuta el script al iniciar Windows con el parámetro `RUN_AT_START`, activando solo la acción de eliminación.
- Elimina automáticamente `service.conf` sin intervención del usuario.

---

## ✅ Requisitos

- Windows 10 o superior.
- Permisos de administrador (el script solicita UAC si no los tiene).
- Destino de instalación predeterminado de AnyDesk: `C:\Program Files\AnyDesk`.

---

## 🧭 Planes futuros / Roadmap

Siguientes actualizaciones planeadas:

- 🎯 Opción para **desactivar inmediatamente** la tarea programada.  
- 📋 Opción para **listar estado** de la tarea (si existe y cuándo se ejecutó por última vez).  
- 📁 Log de operaciones: registrar acciones en archivo `.log`.  
- 🔄 Opción para **reinstalar AnyDesk** o restaurar configuración.  
- 🌍 Localización / traducción a otros idiomas.  

---

## 🤝 Contribuciones y sugerencias

¡Se aceptan Pull Requests y sugerencias!  
Siéntete libre de:

- Reportar bugs o solicitar mejoras.  
- Proponer nuevas funciones o automatizaciones.  
- Unirte al desarrollo o contribuir con documentaciones adicionales.

---

## 📜 Licencia

Este proyecto se distribuye bajo la licencia **MIT**. Revisa el archivo `LICENSE` para más detalles.

---

_Última actualización: julio 2025_

---
