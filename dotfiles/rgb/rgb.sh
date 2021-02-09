BASE_PATH="$(pwd)/$(dirname "$0")"

sudo mkdir "/etc/openrgb"
sudo cp "${BASE_PATH}/rgb.service" "/etc/systemd/system"
sudo cp "${BASE_PATH}/pinkblue.orp" "/etc/openrgb"

sudo systemctl enable rgb.service
