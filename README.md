# user-workload
This sell script is designed to test the impact of user workload on file system performance. 

## Prerequisites

To compile and run these programs, your machine must be running a Linux-based operating system such as CentOS.

## Running with Terminal

To run the .sh script, open up Terminal and navigate to the project directory:

```
cd /home/username/yourdirectory
```

Once in the correct directory, type in the following command with "script" being the name of the script being run:
```
./script.sh <SIZE> <BASE>
```
Where `<SIZE>` is the size of the file in bytes and `<BASE>` a valid multiplier suffix. Valid suffixes include:
- `K` [Kilobyte, 1024]
- `M` [Megabyte, 1024*1024]
- `G` [Gigabyte, 1024*1024]
- And so on for `T`, `P`, `E`, `Z`, `Y`

For example, to test a 500 Megabyte file using the `gen_file.sh` script you would type `./gen_file.sh 500 M`.

## Results

Three file sizes were tested and compared using this script: 1G, 5G, and 10G. Each respective file size was tested three times. The read and write speeds of each trial were recorded and averaged.

### 1 G

#### Trial 1
>$ ./gen_file.sh 1 G  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000405013 s, 2.5 MB/s  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000192833 s, 5.3 MB/s  
1.0G	/local/weka/1G.dat 

#### Trial 2
>$ ./gen_file.sh 1 G  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000303603 s, 3.4 MB/s  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000202262 s, 5.1 MB/s  
1.0G	/local/weka/1G.dat

#### Trial 3
>$ ./gen_file.sh 1 G  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000345507 s, 3.0 MB/s  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000182566 s, 5.6 MB/s  
1.0G	/local/weka/1G.dat

#### Average

The 1G file averaged a write speed of 3.0 MB/s and read speed of 5.3 MB/s.

### 5 G

#### Trial 1
>$ ./gen_file.sh 5 G  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.00043281 s, 2.4 MB/s  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000180751 s, 5.7 MB/s  
5.0G	/local/weka/5G.dat

#### Trial 2
>$ ./gen_file.sh 5 G  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000422753 s, 2.4 MB/s  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000229081 s, 4.5 MB/s  
5.0G	/local/weka/5G.dat  

#### Trial 3
>$ ./gen_file.sh 5 G  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000299901 s, 3.4 MB/s  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000226986 s, 4.5 MB/s  
5.0G	/local/weka/5G.dat  

#### Average

The 5G file averaged a write speed of 2.7 MB/s and read speed of 4.9 MB/s.

### 10 G

#### Trial 1
>$ ./gen_file.sh 10 G  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000367298 s, 2.8 MB/s  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000209456 s, 4.9 MB/s  
10G	/local/weka/10G.dat

#### Trial 2
>$ ./gen_file.sh 10 G  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000408645 s, 2.5 MB/s  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000192694 s, 5.3 MB/s  
10G	/local/weka/10G.dat  

#### Trial 3
>$ ./gen_file.sh 10 G  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000431902 s, 2.4 MB/s  
2+0 records in  
2+0 records out  
1024 bytes (1.0 kB) copied, 0.000218815 s, 4.7 MB/s  
10G	/local/weka/10G.dat  

#### Average

The 10G files averaged a write speed of 2.6 MB/s and read speed of 4.9 MB/s.

## Conclusion

Small file sizes are able to be written rather quickly. As the file size increases, write speed decreases as it becomes more difficult to find enough blocks to write the file. Larger files need to be broken up and cannot be written contiguously. The `sync` command is essential in testing these files because it writes any data buffered in memory to disk. If it were omitted,  the reported speeds could be much faster, incorrectly display the speed of reading/writing the data in RAM.

The read speed for all three file sizes was significantly faster than their respective write speeds. This makes sense as the data simply needs to be read from the disk without the need for additional processing. Like with write speed, read speed also decreases as file size increases. 
