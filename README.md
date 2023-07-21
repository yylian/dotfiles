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
sudo liquidctl --match "Kraken Z" set lcd screen gif /home/yylian/dev/dotfiles/dotfiles/star_wars_cropped_central.gif
```


Linux polki:
```
yay -S polkit-kde-agent
```
Autologin:
```
sudo touch /etc/systemd/system/getty@tty1.service.d/autologin.conf
```
Content:
```
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin yylian %I $TERM
```

Checkout the Hyprland site about [configuration](https://wiki.hyprland.org/Useful-Utilities/)

## Latex Workshop

```
"latex-workshop.latex.tools": [
        {
          "name": "lualatexmk",
          "command": "latexmk",
          "args": [
            "-shell-escape", // yikes
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "-lualatex",
            "-outdir=%OUTDIR%",
            "%DOC%"
          ],
          "env": {}
        },
        {
          "name": "latexmk",
          "command": "latexmk",
          "args": [
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "-pdf",
            "-outdir=%OUTDIR%",
            "%DOC%"
          ],
          "env": {}
        },
        {
          "name": "latexmk_rconly",
          "command": "latexmk",
          "args": [
            "%DOC%"
          ],
          "env": {}
        },
        {
          "name": "pdflatex",
          "command": "pdflatex",
          "args": [
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "%DOC%"
          ],
          "env": {}
        },
        {
          "name": "bibtex",
          "command": "bibtex",
          "args": [
            "%DOCFILE%"
          ],
          "env": {}
        },
        {
          "name": "rnw2tex",
          "command": "Rscript",
          "args": [
            "-e",
            "knitr::opts_knit$set(concordance = TRUE); knitr::knit('%DOCFILE_EXT%')"
          ],
          "env": {}
        },
        {
          "name": "jnw2tex",
          "command": "julia",
          "args": [
            "-e",
            "using Weave; weave(\"%DOC_EXT%\", doctype=\"tex\")"
          ],
          "env": {}
        },
        {
          "name": "jnw2texmintex",
          "command": "julia",
          "args": [
            "-e",
            "using Weave; weave(\"%DOC_EXT%\", doctype=\"texminted\")"
          ],
          "env": {}
        },
        {
          "name": "tectonic",
          "command": "tectonic",
          "args": [
            "--synctex",
            "--keep-logs",
            "%DOC%.tex"
          ],
          "env": {}
        }
      ],
      "latex-workshop.view.pdf.viewer": "tab",
      "latex-workshop.latex.recipe.default": "latexmk (lualatex)",
      "latex-workshop.docker.image.latex": "paulomartde/fast_texlive",
      "latex-workshop.docker.enabled": true,
      "latex-workshop.latex.autoBuild.cleanAndRetry.enabled": false,
      "latex-workshop.latex.autoBuild.run": "onSave"
```
