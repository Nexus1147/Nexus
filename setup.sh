declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/debian_version]=apt-get

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        echo ${osInfo[$f]} detected..
        echo Installing dependencies...
        if ((${osInfo[$f]} == apt-get)); then
            sudo apt-get install wget curl php unzip -y
        fi
        if ((${osInfo[$f]} == pacman)); then
            sudo pacman -S wget curl php unzip --noconfirm
        fi
        if ((${osInfo[$f]} == yum)); then
            sudo yum install wget curl php unzip
        fi
        if ((${osInfo[$f]} == emerge )); then
            sudo emerge -u wget curl php unzip
        fi

    fi


done
echo Installation Completed
echo Blackeye will start automtically
echo Or type '\e[101m\e[1;77m./blackeye.sh\e[0m' manually.