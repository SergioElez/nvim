# nvim
My personal nvim conf

## Instalación Windows
``choco install neovim neovide git make fzf maven openjdk17 python ripgrep nerd-fonts-RobotoMono`` <br/>
``git clone https://github.com/SergioElez/nvim $env:LOCALAPPDATA\nvim`` <br/>

## Linux
``curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz`` <br/>
``sudo rm -rf /opt/nvim`` <br/>
``sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz`` <br/>
``echo export PATH=\"\$PATH:/opt/nvim-linux64/bin\" >> ~/.bashrc`` <br/>
``mkdir -p ~/Programs && curl -L -o ~/Programs/neovide.AppImage https://github.com/neovide/neovide/releases/latest/download/neovide.AppImage && chmod +x ~/Programs/neovide.AppImage`` <br/>
Agregar como programa y poner como argumento 
``--neovim-bin /opt/nvim-linux64/bin/nvim`` <br/>
``git clone https://github.com/SergioElez/nvim ~/.conf/nvim`` <br/>
`` curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/RobotoMono.tar.xz`` <br/>
Abrir zip y instalar la fuente Regular

## Requisitos Tomcat en Windows
- Settear CATALINA_HOME = /mnt/b/apache-tomcat-10.1.11

## Dependencias (Deprecated)
- Instalar wsl ubuntu
- Instalar tmux en el wsl
- Hacer clone del dotfile de tmux
- wget -O ~/.tmux.conf https://raw.githubusercontent.com/SergioElez/dotfiles/master/.tmux.conf

## Version portable en Windows (Sin admin)
- Abrir cmd
- SET INSTALLDIR=c:\ProgramData\chocoportable
- setx ChocolateyInstall %INSTALLDIR%
- ``@powershell -NoProfile -ExecutionPolicy Bypass -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH="%PATH%;%INSTALLDIR%\bin"`` <br/>
- ``choco install neovim neovide.portable git.portable make fzf maven openjdk17 python ripgrep --force --ignore-dependencies`` 
- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip

## Poner en marcha
- Instalar tomcat
- Comprobar que tomcat se ha instalado bien por chocolatey, si no instalarlo a mano IMPORTANTE, INSTALARLO A MANO EN UNA RUTA SIN ESPACIOS
- Abrir nvim como admin
- Esperar a que se instalen los plugins
- Esperar a que se compilen treesitter y etc
- Ejecutar Lazy y actualizar todo
- Ejecutar Mason y instalar todo si falta algo
``:checkhealth``




