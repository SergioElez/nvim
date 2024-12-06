# nvim
My personal nvim conf

## Requisitos
- Poner como variable de entorno HOME = C:\Users\Sergio
- Settear CATALINA_HOME = /mnt/b/apache-tomcat-10.1.11

## Dependencias
``choco install neovim neovide git make fzf maven openjdk17 python ripgrep nerd-fonts-RobotoMono`` 
- Instalar wsl ubuntu
- Instalar tmux en el wsl
- Hacer clone del dotfile de tmux
- wget -O ~/.tmux.conf https://raw.githubusercontent.com/SergioElez/dotfiles/master/.tmux.conf

## Version portable (Sin admin)
- Abrir cmd
- SET INSTALLDIR=c:\ProgramData\chocoportable
- setx ChocolateyInstall %INSTALLDIR%
- ``@powershell -NoProfile -ExecutionPolicy Bypass -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH="%PATH%;%INSTALLDIR%\bin"`` <br/>
- ``choco install neovim neovide.portable git.portable make fzf maven openjdk17 python ripgrep --force --ignore-dependencies`` 
- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip

  
## Instalación
``git clone https://github.com/SergioElez/nvim $env:LOCALAPPDATA\nvim`` <br/>
- Instalar tomcat
- Comprobar que tomcat se ha instalado bien por chocolatey, si no instalarlo a mano IMPORTANTE, INSTALARLO A MANO EN UNA RUTA SIN ESPACIOS
- Abrir nvim como admin
- Esperar a que se instalen los plugins
- Esperar a que se compilen treesitter y etc
- Ejecutar Lazy y actualizar todo
- Ejecutar Mason y instalar todo si falta algo
``:checkhealth``
