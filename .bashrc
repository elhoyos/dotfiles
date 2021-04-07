# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# getSSHPK downloads an ssh key coming in a secret from aws secrets manager and
# passwords protect it
function getSSHPK() {
  (\
    export PK_FILENAME=$1 && \
    export PK_FILE=~/.ssh/$PK_FILENAME && \
    aws secretsmanager get-secret-value --secret-id ssh/$PK_FILENAME | \
      jq '.SecretString' --raw-output > $PK_FILE && \
    chmod 600 $PK_FILE && \
    ssh-keygen -p -f $PK_FILE\
  )
  echo "Done"
}
export -f getSSHPK


# docker_clean removes all images and containers
function docker_clean() {
    read -p 'Are you sure you want to remove all images and containers? (Type "yes" to proceed) ' confirm
    if [ $confirm != "yes" ]; then
      return
    fi

    echo $confirm
 
    sudo docker ps -aq | sudo xargs docker rm && \
    sudo docker images -q | sudo xargs docker rmi && \
    echo "Done"
}
export -f docker_clean

