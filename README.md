# Joyeuse Conteuse MP3 Converter

Ce script shell permet de convertir des fichiers MP3 au format audio compatible avec la conteuse [Joyeuse](https://www.joyeuse.io/).

## Format cible

- Mono (1 canal)
- Fréquence d’échantillonnage : 16 kHz
- Débit : 96 kbps

Les fichiers convertis sont enregistrés dans un sous-dossier `converted/` à la racine du projet.

## Prérequis

- [ffmpeg](https://ffmpeg.org/) doit être installé et accessible dans le PATH.

## Utilisation

```sh
./convert.sh <nom_du_dossier>
