# Makefile for GNAT (Ada) compilation
TARGET = list_tester
PACKAGE = list_package

CC = gcc
CFLAGS = -c -Wall

$(TARGET): $(TARGET).ali $(PACKAGE).o
	gnatbind $(BFLAGS) $(TARGET).ali
	gnatlink $(LFLAGS) $(TARGET).ali -o list_tester

$(TARGET).ali: $(TARGET).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(TARGET).adb

$(PACKAGE).o: $(PACKAGE).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(PACKAGE).adb

clean:
	rm -f $(TARGET) *~ *# *.o *.ali


