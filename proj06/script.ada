Script started on 2020-03-18 22:54:42-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="209" LINES="39"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06[david@davidreidsma proj06]$ cd ada
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ada[david@davidreidsma ada]$ gnatmake array_processor.adb
gcc -c array_processor.adb
gnatbind -x array_processor.ali
gnatlink array_processor.ali
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ada[david@davidreidsma ada]$ ./array_processor 
Enter an array size: 3
Enter value #1: 44.2
Enter value #2: -1
Enter value #3: 5.6
44.2000 -1.0000 5.6000 
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ada[david@davidreidsma ada]$ exit

Script done on 2020-03-18 22:55:08-04:00 [COMMAND_EXIT_CODE="0"]
