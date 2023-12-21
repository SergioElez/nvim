# nvim
My personal nvim conf

## Requisitos
- Poner como variable de entorno HOME = C:\Users\Sergio
- Settear CATALINA_HOME = /mnt/b/apache-tomcat-10.1.11

## Dependencias
``choco install neovim neovide git mingw make fzf maven openjdk17 python ripgrep`` 
- Descargar Nerdfont y ponerla en el terminal de windows
- Instalar wsl ubuntu
- Instalar tmux en el wsl
- Hacer clone del dotfile de tmux
- git clone https://github.com/SergioElez/dotfiles ~
  
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
