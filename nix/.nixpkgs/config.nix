{
  packageOverrides = pkgs: with pkgs; {
    my_vim = vim_configurable.customize {
      name = "my_vim";
      vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
        start = [vim-flake8 vim-go vim-elixir vim-nix vim-fugitive vim-surround fzf vim-projectionist vim-easymotion vim-multiple-cursors];
      };
    };
  };
}
