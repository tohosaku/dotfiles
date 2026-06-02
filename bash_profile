export PATH="${PATH}:${HOME}/.local/bin"

for PROFILE_FILE in $(\ls ~/.bash_profile.d/*.sh 2>/dev/null); do
  source "${PROFILE_FILE}"
done

test -r ~/.bashrc && . ~/.bashrc
