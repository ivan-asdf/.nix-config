{...} : {
  imports = [
    ./nvim
    ./rofi
    ./alacritty
    ./kitty
    ./bash
    ./zsh
    ./firefox
    ./discord
    ./lf
    ./multiplexers/tmux
    ./multiplexers/zellij
  ];

  # programs.wezterm = {
  #   enable = true;
  #   extraConfig = ''
  #     local wezterm = require 'wezterm'
  #     local config = {}
  #
  #     config.color_scheme = 'AdventureTime'
  #     config.font = wezterm.font('Hack')
  #     config.font_size = 10
  #
  #     config.enable_tab_bar = false
  #     config.enable_kitty_graphics=true
  #
  #     return config
  #   '';
  # };
}
