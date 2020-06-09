
if  [ -z $1 ]
then 
echo "setting halide home to the current folder" 
HALIDE_HOME=./halide
else
echo "choosing $1"
HALIDE_HOME=$1/halide
fi

echo "compiling The C program"

gcc addition_c.c -o add_c
echo "done"
./add_c


echo "compiling The Halide Program"
g++ addition_halide.cpp -g -I $HALIDE_HOME/include \
      -I $HALIDE_HOME/tools -L $HALIDE_HOME/bin -lHalide\
       `libpng-config --cflags --ldflags` \
       -ljpeg -o add_halide -std=c++11
echo "done"
LD_LIBRARY_PATH=$HALIDE_HOME/bin ./add_halide