# use X server in WSL
export DISPLAY=127.0.0.1:0

# fix for WSL ls
export LS_COLORS='ow=01;36;40'

export PATH=${PATH}:~/.cargo/bin:~/local/bin

# ttg proxies
# export http_proxy=http://83.133.69.81:3128
# export https_proxy=http://83.133.69.81:3128

export project='/mnt/d/Projects/'
export datf='/mnt/d/Projects/devices-automated-test-framework/'
export robin='/mnt/d/Projects/robin-firmware/'
export dresden_link='/mnt/d/Projects/dresden-link/'
export plugtown='/mnt/d/Projects/plugtown/'

build_rx1 ()
{
        rxc1_root=/mnt/c/Renesas/e2_studio/Tools/Renesas/RX/1_2_1/
        export TCINSTALL=$rxc1_root
        export PATH=$TCINSTALL/bin:$PATH
        export BIN_RX=$TCINSTALL/bin
        export INC_RX=$TCINSTALL/include
        export TCINSTALL=$TCINSTALL
}

build_dresden ()
{
        build_rx1
        export CPU_RX=RX600
        export DEBUG=YES
        export BUILD_LOCAL=NO
}

build_rx2 ()
{
        export TCINSTALL=/mnt/c/Renesas/RX/2_8_0/
        export PATH=$TCINSTALL/bin:$PATH
        export BIN_RX=$TCINSTALL/bin
        export INC_RX=$TCINSTALL/include
        export TCINSTALL=$TCINSTALL
        export TOOL=RX
        export TOOL=RXC
        export BUILD_LOCAL=YES
        export E2STUDIO_PATH=/cygdrive/c/Renesas/e2_studio/
}

build_link710 ()
{
        build_rx2
        export BOARD_TYPE=BOARD_LINK710
        export TARGET_CPU=RX64M
}

build_link610 ()
{
        build_rx2
        export BOARD_TYPE=BOARD_LINK610
        export TARGET_CPU=RX64M
}

build_robin_link ()
{
        build_rx2
        export BOARD_TYPE=BOARD_ROBIN_LINK
        export TARGET_CPU=RX630
}

build_eco ()
{
        build_rx2
        export FUEL_MODEL_VERSION=1_0_15
        export BOARD_TYPE=BOARD_ROBIN_ES1
        export TARGET_CPU=RX630
}

build_eco2 ()
{
        build_rx2
        export FUEL_MODEL_VERSION=1_0_15
        export BOARD_TYPE=BOARD_ROBIN_HW2
        export TARGET_CPU=RX64M
}
