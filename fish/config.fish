if status is-interactive
# Commands to run in interactive sessions can go here
	set fish_greeting
end

starship init fish | source

# aliases
alias ..="cd .."
alias mkdir="mkdir -p"
alias update="yay -Syu && flatpak update"
alias ls="eza --icons --color=always"
alias ll="eza --icons --color=always -l"
alias la="eza --icons --color=always -la"
alias cat="bat"
alias i="yay -S"
alias r="yay -Rns"
alias sklauncher="cd ~/Downloads && GDK_BACKEND=x11 SDL_VIDEODRIVER=x11 java -jar SKlauncher-3.2.18.jar"
alias localsend="flatpak run org.localsend.localsend_app"
alias bluetooth="blueman-manager"
alias wifi="iwgtk"
alias qbittorrent="flatpak run org.qbittorrent.qBittorrent"
alias audio="pavucontrol"
alias s="yay -Ss"
alias unimatrix="unimatrix -a -f -s 95 -c green"

# funtions
function swapfiles
    mv $argv[1] $argv[1].tmp
    mv $argv[2] $argv[1]
    mv $argv[1].tmp $argv[2]
end
