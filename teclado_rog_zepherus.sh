#!/bin/bash

# Descubra os códigos das teclas
KEYCODE_S=39             # Substitua pelo keycode correto para 'S'
KEYCODE_BRACKETLEFT=34   # Substitua pelo keycode correto para '['

# Aplicar remapeamento temporário
xmodmap -e "keycode $KEYCODE_S = bracketleft"
xmodmap -e "keycode $KEYCODE_BRACKETLEFT = s"

# Criar ou sobrescrever o arquivo .Xmodmap para persistir o remapeamento
cat <<EOF > ~/.Xmodmap
keycode $KEYCODE_S = bracketleft
keycode $KEYCODE_BRACKETLEFT = s
EOF

echo "Remapeamento aplicado e configurado para carregar automaticamente."

# Adicionar comando para carregar o remapeamento no início da sessão (se ainda não estiver configurado)
if ! grep -q "xmodmap ~/.Xmodmap" ~/.bashrc; then
  echo "xmodmap ~/.Xmodmap" >> ~/.bashrc
  echo "Adicionado ao ~/.bashrc para inicialização automática."
fi
