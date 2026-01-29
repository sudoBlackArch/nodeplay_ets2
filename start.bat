@echo off
echo --- Downloading Server Packages (Bypassing Panel) ---

:: Скачиваем .dat файл (флаг -L нужен для переадресаций, -o для сохранения)
:: ВАЖНО: Укажите прямую ссылку. Если используете Discord - ссылка идеальна.
curl -L -o server_packages.dat "https://raw.githubusercontent.com/sudoBlackArch/nodeplay_ets2/main/server_packages.dat"

:: Скачиваем .sii файл (на всякий случай, чтобы была пара)
curl -L -o server_packages.sii "https://raw.githubusercontent.com/sudoBlackArch/nodeplay_ets2/main/server_packages.sii"

echo --- Starting Euro Truck Simulator 2 Server ---

:: Запуск самого сервера (ваша обычная строка запуска)
bin\win_x64\eurotrucks2_server.exe -homedir "." -mm_pool_size 128 -server "server_packages.sii" -server_cfg "server_config.sii" -nosingle