# PATH expanding
pathdirs=(
~/bin
~/local/bin
~/exe
/net/nfs/opt/bin
/usr/local/go/bin
/usr/local/texlive/2014/bin/x86_64-linux
)

for dir in $pathdirs; do
  if [ -d $dir ];then 
    path+=$dir
  fi
done
