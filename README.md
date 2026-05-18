# Сборка Windows-исполняемого для проекта

Краткая инструкция по упаковке приложения в папку с exe (Windows).

Локальная сборка на Windows
- Установите Python 3.10/3.11 и добавьте `python` в PATH.
- Откройте командную строку в корне репозитория и выполните:

```bat
python -m pip install --upgrade pip
pip install -r requirements.txt
python -m playwright install --with-deps
pyinstaller --noconfirm --onedir --windowed --name DomophonesGUI main.py
```

После успешной сборки папка `dist\DomophonesGUI` будет содержать `DomophonesGUI.exe` и все зависимости.

Сборка через GitHub Actions (Windows)
- В репозитории уже добавлена workflow: `.github/workflows/build-windows.yml`.
- Запушьте в репозиторий — Action соберёт артефакт `dist/DomophonesGUI` и загрузит его как артефакт сборки.

Важные замечания
- PyInstaller обычно нужно запускать на той же ОС, для которой вы собираете исполняемый файл. Сборка Windows exe на Linux не гарантируется.
- Playwright требует браузерные бинарники. Мы вызываем `python -m playwright install --with-deps` в процессе сборки; если они не были включены, запустите эту команду на машине, где будет запускаться exe.
- Если хотите единый `--onefile` exe, попробуйте `--onefile`, но GUI-приложения и Playwright могут требовать дополнительной настройки.

Если хотите, могу настроить автоматическую сборку и выгрузку релиза (GitHub Actions) прямо сейчас.
# script