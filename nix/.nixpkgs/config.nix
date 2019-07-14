{
  packageOverrides = pkgs: with pkgs; {
    myVim = vim_configurable.override { python = python3; };
    vimrcConfig.plug.plugins = with pkgs.vimPlugins; [

      SimpylFold
      FastFold
      vim-flake8
      black
      Zenburn
      fzf
      ack.vim
      vim-fugitive
      vim-surround
      ale
      vim-projectionist
      vim-go
      vim-elixir
      vim-easymotion
      vim-ultisnips
      vim-graphql
      vim-multiple-cursors
      vim-nix

    ];
  };
}
