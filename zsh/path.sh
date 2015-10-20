# PATH expanding
#pathdirs=(
#/net/nfs/opt/bin
#$HOME/bin
#$HOME/exe
#$HOME/.linuxbrew/bin
#/usr/local/go/bin
#/usr/local/texlive/2014/bin/x86_64-linux
#)
#
#for dir in $pathdirs; do
#  if [ -d $dir ];then 
#    path+=$dir
#  fi
#done

export PATH="$HOME/local/bin:$HOME/bin:$HOME/exe:/net/nfs/opt/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/local/lib:$HOME/local/lib64:$LD_LIBRARY_PATH"
#export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
#export INFOPATH="$HOME/.linuxbrew/share/man:$INFOPATH"
