#!/bin/bash

# Baixar o Flutter SDK
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# Adicionar Flutter ao PATH
export PATH="$PATH:pwd/flutter/bin"

# Executar o comando de build do Flutter
flutter build web --release