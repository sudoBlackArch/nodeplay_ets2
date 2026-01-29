@echo off
echo --- FORCE UPDATE: Downloading Server Map Data ---

:: 1. Удаляем старые файлы (чтобы curl не ругался или не создавал дубликаты)
del /Q server_packages.dat
del /Q server_packages.sii

:: 2. Скачиваем файлы ПРЯМО В КОРЕНЬ (так как мы используем homedir ".")
:: Ссылки должны быть RAW (как у вас сейчас - это верно)
curl -L -o server_packages.dat "https://raw.githubusercontent.com/sudoBlackArch/nodeplay_ets2/main/server_packages.dat"
curl -L -o server_packages.sii "https://raw.githubusercontent.com/sudoBlackArch/nodeplay_ets2/main/server_packages.sii"

echo --- Starting ETS2 Dedicated Server ---

:: 3. Запускаем сервер
:: Путь указываем от корня. %* передает аргументы из панели в этот файл, но мы пропишем их жестко для надежности.
bin\win_x64\eurotrucks2_server.exe -homedir "." -mm_pool_size 128 -server "server_packages.sii" -server_cfg "server_config.sii" -nosingle
