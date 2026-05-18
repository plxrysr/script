@echo off
REM Устанавливает зависимости и собирает папку с exe при запуске на Windows
python -m pip install --upgrade pip
pip install -r requirements.txt
REM Установить браузеры playwright
python -m playwright install --with-deps
REM Собрать в папку (рекомендуется --onedir для GUI приложений)
pyinstaller --noconfirm --onedir --windowed --name DomophonesGUI main.py
echo Сборка завершена. Результат в папке dist\DomophonesGUI
pause
