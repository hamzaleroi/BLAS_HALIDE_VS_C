## What does the script do

The script does the operation :  
              C = L*A + B  
given: 
  1. A,B,C are matrices where A of shape(X,Y) and B of shape(X,Y) (by default X=5 and Y=5).  
  2. L is a given constant (by default L=5)

## How to change the values of X,Y,L:

The values are defined in the programs with the macro ``#define``  

## How to run the script:

to execute the script run the following command
```bash
./running_script.sh HALIDE_HOME
```

if HALIDE_HOME is not set, the script will automatically point to the current folder

## what is HALIDE_HOME:
HALIDE_HOME is the location that points to the halide binary.
Please make sure it has the flollowing tree:

halide
    |>  bin/  
    |>  include/  
    |>  lib/  
    |>  tools/  

## Downlaoding halide
There is a helper script to download halide and uncompress it, to run it:

```bash
./download.sh HALIDE_HOME
```

## Note:

The scripts have been tested only on Linux.