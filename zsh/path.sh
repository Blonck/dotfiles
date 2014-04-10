# PATH expanding
pathdirs=(
~/bin
~/exe
/net/nfs/opt/bin
)

for dir in $pathdirs; do
  if [ -d $dir ];then 
    path+=$dir
  fi
done


