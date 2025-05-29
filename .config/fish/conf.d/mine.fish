
# Networking
# -----------------------------------------------------------------------------
function netstatplant -d "netstat -plant but on osx"
  netstat -l -p tcp -van | rg -i listen --color=never
end

# Editor
# -----------------------------------------------------------------------------
function v --wraps vim
  vim -u NONE $argv
end

function nv --wraps vvim
  nvim $argv
end

# Files and Searching
# -----------------------------------------------------------------------------
function fif -d "[F]ind [I]n [F]iles" -a input -a path
  set -q thispath thispath; or set thispath (pwd)
  rg --files-with-matches --no-messages "$input" "$thispath" | fzf $FZF_PREVIEW_WINDOW --preview "rg  --color=always --ignore-case --pretty --context 10 '$1' {}"
end

function cdd -d "Move into the directory of the given file"
  cd (dirname $argv[1])
end

function ltr -d "[Ls] -l[TR]" --wraps=ls
  ls -ltr $argv
end

# JSON
# -----------------------------------------------------------------------------
function jl --wraps=jless
  jless -m line $argv
end

# Git / Github
# -----------------------------------------------------------------------------
function git_current_branch -d 'Detect name of current branch of current git repository'
  echo (git branch --show-current)
end

function ghmine -d "Review PRs assigned to me"
  gh pr list --search "review:required draft:false user-review-requested:@me"
end

function pro -d "[PR] [O]pen in web"
  gh pr view -w
end

function grr --wraps=git
  echo 'git rebase -i HEAD~2' | read -l res; and commandline -r $res
end

function gll
  git loggraph $argv
end

function gl
  git logline $argv
end

function gs
  git status
end

function gd
  git diff
end

function ggpull
  git pull origin (git_current_branch)
end

function ggpush
  git push origin (git_current_branch) $argv
end

function gb
  echo (git branch -a | fzf) | read -l res; and commandline -r "git checkout $res"
end

function gcb --wraps=git
  git checkout -b $argv
end

function gco --wraps=git
  git checkout $argv
end

function gwd --wraps=git
  git worktree remove $argv
  git worktree prune
  git branch -D $argv
end

function gss -wraps=git -d="Start nvim showing only the git status pane"
  # Note: The following one only works if you have neovim and the vim-fugitive plugin installed
  # Start vim showing the only git status pane
  nvim -p -c :Git -c :only
end

# Tmux
# -----------------------------------------------------------------------------
function t --wraps=tmux
  tmux $argv
end

function tas
  tmux attach -t $argv
end

function tns
  set def (basename (pwd))
  set sname $argv[1] || $def
  tmux new -s $def
end

# Docker
# -----------------------------------------------------------------------------
function dkrshell -d "Start a container and get a shell on it" -a image -a should_mount -a port_to_map -a shell_to_start --wraps=docker
  set -q _shell $shell_to_start || set _shell '/bin/bash'

  set host_port (echo $port_to_map | awk -F: '{ print $1 }')
  set container_port (echo $port_to_map | awk -F: '{ print $2 }')

  if test -z $should_mount
    docker run -it --entrypoint="" -u root (if test $port_to_map; echo "-p $host_port:$container_port"; end) $image $_shell
  else
    docker run -it --entrypoint="" -u root (if test $port_to_map; echo "--publish=$host_port:$container_port"; end ) -v (pwd):$should_mount $image $_shell
  end
end

function dkrimgs -d "List of docker images, just repos"
  docker images --format='{{ .Repository }}' | sort
end
