unameOut="$(uname -s)"
case "${unameOut}" in
Linux*) machine=Linux ;;
Darwin*) machine=Mac ;;
CYGWIN*) machine=Cygwin ;;
MINGW*) machine=MinGw ;;
*) machine="UNKNOWN:${unameOut}" ;;
esac
echo ${machine}

if [ -z $1 ]; then
      echo "setting halide home to the current folder"
      HALIDE_HOME=./halide
else
      echo "choosing $1"
      HALIDE_HOME=$1/halide
fi

if [ ! -d "$HALIDE_HOME" ]; then
      echo "error !! this is not a halide directory"
      echo "[SOLUTION]: use the downloading scrip instead"
      exit 1
fi

echo "compiling The C program"

gcc addition_c.c -o add_c
echo "done"
./add_c

if [ $machine = Linux ]; then
      echo "this is linux"
      echo "compiling The Halide Program"
      g++ addition_halide.cpp -g -I $HALIDE_HOME/include \
            -I $HALIDE_HOME/tools -L $HALIDE_HOME/bin -lHalide $(libpng-config --cflags --ldflags) \
            -ljpeg -o add_halide -std=c++11
      echo "done"
      LD_LIBRARY_PATH=$HALIDE_HOME/bin ./add_halide

fi

if [ $machine = Mac ]; then
      echo "this is a Mac"
      echo "compiling The Halide Program"
      gg++ addition_halide.cpp -g -std=c++11 -I $HALIDE_HOME/include -L $HALIDE_HOME/bin -lHalide -o add_halide
      echo "done"
      DYLD_LIBRARY_PATH=$HALIDE_HOME/bin ./add_halide

fi
