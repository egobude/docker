# Docker Stress Container

## Usage

If I wanted to stress the CPU, RAM and the HDD at the same time, then I can use it in the below format. After running for 40 seconds, it will exit automatically.

    stress -c 4 -m 2 -d 1 -t 40s
