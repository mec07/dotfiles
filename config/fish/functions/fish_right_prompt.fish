function fish_right_prompt
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

  echo -e -n -s $k8s_color "($k8s_context)"
end
