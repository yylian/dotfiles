BASE_PATH="$(pwd)/$(dirname "$0")"

sudo mkdir -p "/root/.config/OpenRGB"
sudo cp "${BASE_PATH}/rgb.service" "/etc/systemd/system"
sudo ln -sf "${BASE_PATH}/pinkblue.orp" "/root/.config/OpenRGB"

sudo systemctl enable rgb.service
