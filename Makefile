#
# smallptGPU & smallptCPU Makefile
#

ATISTREAMSDKROOT=/home/david/src/ati-stream-sdk-v2.0-lnx64

CC=gcc
CCFLAGS=-O3 -ftree-vectorize -msse -msse2 -msse3 -mssse3 -fvariable-expansion-in-unroller -march=native -funroll-loops -mfpmath=sse -ffast-math -Wall
# Jens's patch for MacOS, comment the 1 line above and un-comment the lines below
#CCFLAGS=-O3 -ftree-vectorize -msse -msse2 -msse3 -mssse3 -fvariable-expansion-in-unroller \
#	-cl-fast-relaxed-math -cl-mad-enable -Wall -framework OpenCL -framework OpenGl -framework Glut

default: all

all: Makefile smallptGPU

smallptGPU: smallptGPU.c displayfunc.c Makefile vec.h camera.h geom.h displayfunc.h simplernd.h scene.h geomfunc.h 
	$(CC) $(CCFLAGS) -DSMALLPT_GPU -o smallptGPU smallptGPU.c displayfunc.c  -s -I. C:/Windows/System32/OpenCL.dll  -lopengl32 -lglu32 -lComdlg32 -lgdi32  -lglut32   -static  -static-libgcc

clean:
	rm -rf smallptGPU image.ppm