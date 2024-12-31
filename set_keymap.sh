#!/bin/bash

# Descubra os códigos das teclas
KEYCODE_S=39             # Substitua pelo keycode correto para 'S'
KEYCODE_BRACKETLEFT=34   # Substitua pelo keycode correto para '['

# Aplicar remapeamento temporário
xmodmap -e "keycode 66 = Alt_L"       # Caps Lock vira Left Alt

# Troca Left Alt por Caps Lock (opcional)
xmodmap -e "keycode 64 = Caps_Lock"   # Left Alt vira Caps Lock (se desejado)

# Troca [ por Right Ctrl
xmodmap -e "keycode 34 = Control_R"   # [ vira Right Ctrl

# Troca Right Ctrl por [
xmodmap -e "keycode 105 = bracketleft" # Right Ctrl vira [

# Troca s por [
xmodmap -e "keycode 39 = bracketleft"  # s vira [

# Troca [ por s
xmodmap -e "keycode 34 = s"    
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
