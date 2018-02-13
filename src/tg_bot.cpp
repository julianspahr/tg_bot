//============================================================================
// Name        : tg_bot.cpp
// Author      : Julian Spahr
// Version     :
// Copyright   : 
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <string>
#include <fcntl.h>
#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>
#include <tgbot/bot.h>
#include <iostream>

using namespace tgbot;
using namespace types;
using namespace methods;

#define MAX_BUF			(256 * 1024)
int fd;
char * myfifo = "C:/Julian/Projects/D0215432_Hercules/navb_tb/fifo/myfifo";
char buf[MAX_BUF];

/* open, read, and display the message from the FIFO */

void echoBack(const Message message, const Api& api) {
	api.sendMessage(std::to_string(message.chat.id), "Ready to report.\n ");
	while (1 < 2) {
		if (read(fd, buf, MAX_BUF)) {
			api.sendMessage(std::to_string(message.chat.id), buf);
		}
		memset(buf, 0, sizeof(buf));
		//api.sendMessage(std::to_string(message.chat.id), *message.text);
	}
}

int main() {
	LongPollBot bot("461916870:AAF4LbTNzlIEnX53Rtd7Nr5yMie3t_v_ruY");

	fd = open(myfifo, O_RDONLY);

	bot.callback(echoBack);
	bot.start();

//unreachable code
}
