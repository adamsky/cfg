#! /usr/bin/fish

git clone --bare https://github.com/adamsky/cfg $HOME/.cfg
function config
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
mkdir -p .config-backup
config checkout
if math "$status == 0" > /dev/null
  echo "Checked out config."
else
  echo "Backing up pre-existing dot files."
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
end
config checkout
config config status.showUntrackedFiles no
