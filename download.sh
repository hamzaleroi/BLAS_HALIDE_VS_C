LINUX_64_TGZ=halide-linux-64-gcc53-800-65c26cba6a3eca2d08a0bccf113ca28746012cc3.tgz
MAC_64_TGZ=halide-mac-64-800-65c26cba6a3eca2d08a0bccf113ca28746012cc3.tgz
LINUX_64_LINK=https://github.com/halide/Halide/releases/download/release_2019_08_27/$LINUX_64_TGZ
MAC_64_LINK=https://github.com/halide/Halide/releases/download/release_2019_08_27/$MAC_64_TGZ

unameOut="$(uname -s)"
case "${unameOut}" in
Linux*) machine=Linux ;;
Darwin*) machine=Mac ;;
CYGWIN*) machine=Cygwin ;;
MINGW*) machine=MinGw ;;
*) machine="UNKNOWN:${unameOut}" ;;
esac
echo ${machine}

if [ $machine = Linux ]; then
  echo "this is linux"
  wget $LINUX_64_LINK
  tar -xvzf $LINUX_64_TGZ
fi

if [ $machine = Mac ]; then
  echo "this is a Mac"
  wget $MAC_64_LINK
  tar -xvzf $MAC_64_TGZ
fi
