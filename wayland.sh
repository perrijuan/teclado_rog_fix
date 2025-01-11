#!/bin/bash

# Caminho de configuração
CONFIG_DIR="$HOME/.config/evdevremapkeys"
CONFIG_FILE="$CONFIG_DIR/config.json"

# Certifique-se de que o diretório de configuração existe
mkdir -p "$CONFIG_DIR"

# Crie o arquivo de configuração
cat <<EOF > "$CONFIG_FILE"
{
    "devices": [
        {
            "input": "/dev/input/event3",
            "name": "Teclado Personalizado",
            "remappings": {
                "KEY_S": "KEY_LEFTBRACE",
                "KEY_LEFTBRACE": "KEY_S",
                "KEY_CAPSLOCK": "KEY_LEFTALT",
                "KEY_LEFTALT": "KEY_CAPSLOCK",
                "KEY_RIGHTCTRL": "KEY_LEFTBRACE"
            }
        }
    ]
}
EOF

# Ativar o serviço
echo "Ativando o serviço evdevremapkeys..."
systemctl --user enable evdevremapkeys.service
systemctl --user start evdevremapkeys.service

echo "Configuração aplicada. Configuração salva em $CONFIG_FILE"
