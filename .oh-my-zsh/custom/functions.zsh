### Functions ### {{{
#

# powerline custom aws profile view
zsh_aws() {
  if [ "$AWS_DEFAULT_PROFILE" != "default" ]; then
    local color='%F{208}'
    echo -n "\ue7ad ${AWS_DEFAULT_PROFILE}"
  fi
}

### KUBERNETES ###

# powerline custom kubernetes view
zsh_kubernetes() {
  if [[ ${KUBERNETES_DISPLAY} ]]; then
    context=$(kubectl config current-context | awk -F\. '{print $1}')
    namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}')
    local color='%F{68}'
    echo -n "\ufd31 ${context} | ${namespace}"
  fi
}

### Functions ### }}}

