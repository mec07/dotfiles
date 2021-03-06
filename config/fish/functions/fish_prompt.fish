function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l fish     "⋊>"
  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄ "
  set -l dirty    "⨯"
  set -l none     "◦"

  set -l normal_color     (set_color normal)
  set -l success_color    (set_color $fish_pager_color_progress ^/dev/null; or set_color cyan)
  set -l error_color      (set_color $fish_color_error ^/dev/null; or set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote ^/dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd ^/dev/null; or set_color green)

  if test $last_command_status -eq 0
    echo -n -s $success_color $fish $normal_color
  else
    echo -n -s $error_color $fish $normal_color
  end

  if git_is_repo
    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel ^/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")

      echo -n -s " " $directory_color $cwd $normal_color
    else
      echo -n -s " " $directory_color $cwd $normal_color
    end

    echo -n -s " on " $repository_color (git_branch_name) $normal_color " "

    if git_is_touched
      echo -n -s $dirty
    else
      echo -n -s (git_ahead $ahead $behind $diverged $none)
    end
  else
    echo -n -s " " $directory_color $cwd $normal_color
  end

  #######################
  # Virtual environment
  #######################
  echo -n -s " "
  if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end

  #######################
  # Kubernetes context
  #######################
  set -l k8s_color (set_color blue)

  set -l K8_CONTEXT (kubectl config current-context)

  # Extract GCP metadata from the kubectl context name
  switch $K8_CONTEXT
  case 'gke_*'
    # kubectl context isn't a custom one
    set FULL_CONTEXT $K8_CONTEXT
  case '*'
    set FULL_CONTEXT (kubectl config get-contexts $K8_CONTEXT | grep $K8_CONTEXT | awk '{print $3}'  )
  end
  set -l CLUSTER (echo $FULL_CONTEXT | cut -d_ -f4)

  set -l k8s_context $CLUSTER

  echo -e -n -s " " $k8s_color "($k8s_context)"


  #######################
  # New line
  #######################
  echo -n -s "
> "
end
