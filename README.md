## How to use the script:

to execute the script run the following command
```bash
./running_script.sh HALIDE_HOME
```

if HALIDE_HOME is not set, the script will automatically point to the current folder

## what is HALIDE_HOME:
HALIDE_HOME is the script that points to the halide binary.
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