# 🚀 Git Commits desde la Terminal — Guía Completa

> Aprende todo sobre commits de Git de forma clara, ordenada y práctica.

---

## ¿Qué es un commit?

Un **commit** es una "fotografía" del estado de tu proyecto en un momento dado. Cada commit guarda:
- Los cambios realizados en los archivos
- Un mensaje descriptivo de qué cambió
- Quién hizo el cambio y cuándo

---

## 📋 Flujo básico de un commit

```bash
# 1. Ver el estado actual del repositorio
git status

# 2. Agregar archivos al área de preparación (staging)
git add nombre-archivo.txt       # Un archivo específico
git add .                        # Todos los archivos modificados

# 3. Hacer el commit con un mensaje
git commit -m "Tu mensaje aquí"
```

---

## 🛠️ Comandos esenciales

### Ver cambios antes de commitear

```bash
git diff                    # Cambios en archivos no agregados al staging
git diff --staged           # Cambios en archivos ya en staging
git status                  # Resumen general del estado
```

### Agregar archivos al staging

```bash
git add archivo.txt         # Archivo específico
git add carpeta/            # Toda una carpeta
git add *.js                # Todos los archivos .js
git add .                   # Todo lo modificado/nuevo
git add -p                  # Modo interactivo (elige qué partes agregar)
```

### Hacer el commit

```bash
git commit -m "mensaje"             # Commit rápido con mensaje
git commit                          # Abre el editor para escribir mensaje largo
git commit -am "mensaje"            # Agrega y commitea en un solo paso (solo archivos trackeados)
git commit --allow-empty -m "msg"   # Commit vacío (útil para marcar hitos)
```

---

## ✍️ Cómo escribir buenos mensajes de commit

Un buen mensaje de commit es **claro, conciso y en tiempo presente**.

### Formato recomendado (Conventional Commits)

```
tipo(alcance): descripción corta

Cuerpo opcional con más detalles...

Footer opcional (closes #123)
```

### Tipos más usados

| Tipo       | Cuándo usarlo                              |
|------------|--------------------------------------------|
| `feat`     | Nueva funcionalidad                        |
| `fix`      | Corrección de un bug                       |
| `docs`     | Cambios en documentación                   |
| `style`    | Formato, espacios (sin cambios de lógica)  |
| `refactor` | Reestructuración de código                 |
| `test`     | Agregar o corregir tests                   |
| `chore`    | Tareas de mantenimiento, dependencias      |

### Ejemplos

```bash
git commit -m "feat(auth): agregar login con Google"
git commit -m "fix(api): corregir error 500 en endpoint de usuarios"
git commit -m "docs: actualizar README con instrucciones de instalación"
```

### ❌ Mensajes que debes evitar

```
git commit -m "cambios"
git commit -m "arreglado"
git commit -m "wip"
git commit -m "asdfgh"
```

---

## 🔍 Ver el historial de commits

```bash
git log                         # Historial completo
git log --oneline               # Historial compacto (una línea por commit)
git log --oneline --graph       # Con árbol visual de ramas
git log -5                      # Solo los últimos 5 commits
git log --author="Tu Nombre"    # Commits de un autor específico
git log -- archivo.txt          # Commits que afectan un archivo
git show <hash>                 # Ver detalles de un commit específico
```

---

## ↩️ Deshacer commits

### Quitar del staging (sin perder cambios)

```bash
git restore --staged archivo.txt    # Quita un archivo del staging
git restore --staged .              # Quita todo del staging
```

### Modificar el último commit

```bash
git commit --amend -m "mensaje corregido"   # Cambiar solo el mensaje
git commit --amend                           # Abrir editor para editar
git commit --amend --no-edit                # Agregar archivos sin cambiar mensaje
```
> ⚠️ Solo usar `--amend` si el commit **no ha sido enviado** al repositorio remoto.

### Revertir commits (sin reescribir historia)

```bash
git revert <hash>           # Crea un nuevo commit que deshace el anterior
git revert HEAD             # Revierte el último commit
```

### Reset (reescribe la historia — úsalo con cuidado)

```bash
git reset --soft HEAD~1     # Deshace el commit, mantiene cambios en staging
git reset --mixed HEAD~1    # Deshace el commit, mantiene cambios sin staging
git reset --hard HEAD~1     # Deshace el commit Y borra los cambios permanentemente
```

> 🚨 `--hard` es **irreversible** para los cambios no commiteados. Úsalo con precaución.

---

## 🏷️ Tags en commits

Los tags marcan commits importantes (versiones, releases).

```bash
git tag v1.0.0                          # Tag ligero
git tag -a v1.0.0 -m "Primera versión" # Tag anotado (recomendado)
git tag                                 # Listar todos los tags
git push origin v1.0.0                  # Enviar tag al remoto
git push origin --tags                  # Enviar todos los tags
```

---

## 🌿 Commits en ramas

```bash
git checkout -b nueva-rama          # Crear y moverse a una nueva rama
git switch -c nueva-rama            # (Equivalente moderno)

# Haz tus cambios y commits normalmente...

git checkout main                   # Volver a main
git merge nueva-rama                # Fusionar la rama
```

---

## 🔗 Enviar commits al remoto

```bash
git push                        # Enviar commits al remoto (rama actual)
git push origin main            # Enviar específicamente a origin/main
git push -u origin nueva-rama   # Enviar rama nueva y configurar tracking
git push --force-with-lease     # Push forzado (más seguro que --force)
```

---

## 🧩 Flujo de trabajo completo — Ejemplo real

```bash
# 1. Actualiza tu código local
git pull origin main

# 2. Crea una rama para tu tarea
git checkout -b feat/formulario-contacto

# 3. Desarrolla...
# (editas archivos)

# 4. Revisa qué cambiaste
git status
git diff

# 5. Agrega los cambios
git add src/components/ContactForm.jsx
git add src/styles/contact.css

# 6. Commitea con un mensaje claro
git commit -m "feat(contact): agregar formulario con validación"

# 7. Envía tu rama al remoto
git push -u origin feat/formulario-contacto

# 8. Abre un Pull Request en GitHub/GitLab ✅
```

---

## 📌 Referencia rápida

| Comando                        | Descripción                          |
|-------------------------------|--------------------------------------|
| `git status`                  | Ver estado del repositorio           |
| `git add .`                   | Agregar todo al staging              |
| `git commit -m "msg"`         | Crear un commit                      |
| `git log --oneline`           | Ver historial compacto               |
| `git commit --amend`          | Modificar el último commit           |
| `git revert HEAD`             | Revertir el último commit            |
| `git reset --soft HEAD~1`     | Deshacer commit (mantener cambios)   |
| `git push`                    | Enviar commits al remoto             |
| `git tag -a v1.0.0 -m "..."`  | Crear un tag anotado                 |

---

> 💡 **Tip final:** Haz commits pequeños y frecuentes. Es mejor tener 10 commits claros que 1 commit enorme con todo mezclado.
