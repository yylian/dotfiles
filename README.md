# dotfiles

These are my very own dotfiles. The setup scripts are just a guide, not intended
for actual execution. The config files are mostly cross platform compatible,
there should be no problem running them on either Linux or MacOs.

## Setup

To add the ssh key permanent to the keystore on MacOS:
```
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

To set the pumpled to a gif on Linux:
```
sudo liquidctl --match "Kraken Z" set lcd screen brightness 10
sudo liquidctl --match "Kraken Z" set lcd screen orientation 270
sudo liquidctl --match "Kraken Z" set lcd screen gif /home/yylian/Downloads/star_wars_cropped_central.gif
```