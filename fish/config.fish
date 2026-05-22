if status is-interactive
# Commands to run in interactive sessions can go here
	set fish_greeting
end

starship init fish | source

fish_add_path /home/dragon/.spicetify

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
alias weather="curl wttr.in"
alias bluetooth="blueman-manager"
alias wifi="iwgtk"
alias qbittorrent="flatpak run org.qbittorrent.qBittorrent"
alias audio="pavucontrol"
alias Ss="yay -Ss"
