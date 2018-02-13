[![license](https://img.shields.io/github/license/StefanoBelli/telegram-bot-api.svg)](https://github.com/StefanoBelli/telegram-bot-api/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/StefanoBelli/telegram-bot-api/all.svg)](https://github.com/StefanoBelli/telegram-bot-api/tags)
[![Travis](https://img.shields.io/travis/StefanoBelli/telegram-bot-api.svg)](https://travis-ci.org/StefanoBelli/telegram-bot-api)

# telegram-bot-api
C++ Telegram Bot APIs

*This API wrapper tries to be more conformant as possible to Telegram Bot API, which you are invited to read.*

[Telegram Bot API](https://core.telegram.org/bots/api)

### Thanks to 

Deni, which tested some API methods, and proposed some examples! (He is listed in contributors)

### Issues
You are welcome to open issues, do it without freaking out and/or insults, attach your code (take care of your **token**), and what is not going well. 

### Behaviour
 * With long poll bots, you have a connection always on to the telegram API endpoint, used to retrieve updates.
 * When an update is received, update gets dispatched and assigned to the default callback assigned, if no callback registered, update gets ignored forever.
 * A thread gets spawned and the callback actually called, then detached from program execution, it is expected to terminate when assigned callback ends
 * Your stuffs...

Another connection gets openen when using API methods, so this may slow down a little bit your bot experience.

Unfortunately this is the most safe way we have to avoid race conditions, phenomen caused by multithreading on shared CURL instance.

### Error reporting
Function will return surely (unless parsing errors of mine) the expected result.

If telegram API reports error, *TelegramException* gets thrown. So you may want to use try-catch blocks

### Signal handling
What we would like to have, when SIGINT (^C sequence) is sent to the program is to exit loop and follow cleanup operations. In this case, we cannot do this. Assuming to use a control variable, this control variable gets successfully changed when asynchronus signal is received, BUT, loop exits at the next iteration, not immediatly. Not our expected behaviour. Let the program die, the operating system will free previously allocated memory. (CURL resources)

### Example
A simple echo-back bot (long poll)

```c++
#include <string>
#include <tgbot/bot.h>

using namespace tgbot;
using namespace types;
using namespace methods;

void echoBack(const Message message, const Api& api) {
	api.sendMessage(std::to_string(message.chat.id), *message.text);
}

int main() {
	LongPollBot bot("token");
	bot.callback(echoBack);
	bot.start();
	
	//unreachable code
}
```

*I would suggest you to add a filter for updates, I mean, if your bot expects only messages, LongPollBot constructor allows you to add filters and get only certain update types*

#### How to properly compile it

Assuming we call this file *bot.cpp* and it is placed one level up telegram-bot-api source tree, this would be its compilation command (GCC-C++):

~~~
$ g++ bot.cpp -Itelegram-bot-api/include telegram-bot-api/lib/libtgbot.a -lcurl -ljsoncpp -pthread
~~~

Others may result in linkage error.

### Note on building
If API build cannot get done because of missing headers, the problem is more likely to be related with *jsoncpp* headers: many package management systems are instructed to place headers to */usr/include* or */usr/include/json*, so I cannot tell compiler to look for *jsoncpp/json/json.h*.

In case compiler exits with failure saying it couldn't find any *json/json.h*, just do the following:

 * clean CMake project directory
 * re-run cmake with previous parameters, PLUS, *-DOTHER_HDR_DIR="/usr/include/jsoncpp"*
 * it should work now

### getUpdates
Is used within project implementation, and not "publicly" availible

### Documentation
Documentation is automatically generated by Doxygen and deployed by continuous integration tool after build succeed.

[TgBot documentation](http://stefanobelli.github.io/telegram-bot-api)

### Implementation status

 * Internal project utils [ directory: *include/tgbot/utils* ]
    
    * [x] HTTPS interface (libcurl wrapper)

 * Basic Bot interface [ files: *include/tgbot/bot.h* and *include/tgbot/register_callback.h* ]
    
    * [x] Bot class

    * [x] RegisterCallback class
    
 * API Types [ file: *include/tgbot/types.h* ]
 
    * [x]   User

	* [x]	ChatPhoto

	* [x]	MessageEntity
	
	* [x]	Audio
	
	* [x]	PhotoSize
	
	* [x]	Document
	
	* [x]	Voice
	
	* [x]	Contact
	
	* [x]	Location
	
	* [x]	Animation
	
	* [x]	Venue
	
	* [x]	VideoNote
	
	* [x]	MaskPosition
	
	* [x]	Sticker
	
	* [x]	StickerSet
	
	* [x]	Video
	
	* [x]	Invoice
	
	* [x]	ShippingAddress
	
	* [x]	OrderInfo
	
	* [x]	SuccessfulPayment
	
	* [x]	Game
	
	* [x]	Chat
	
	* [x]	Message
	
	* [x]	InlineQuery
	
	* [x]	ChosenInlineResult
	
	* [x]	CallbackQuery
	
	* [x]	ShippingQuery
	
	* [x]	PreCheckoutQuery
	
	* [x]	Update
	
	* [x]	ResponseParameters
	
	* [x]	File
	
	* [x]	UserProfilePhotos
	
	* [x]	KeyboardButton

	* [x]   ChatMember
	
 * API Methods and input types [ directory: *include/tgbot/methods* ]

	* [x]  ChatMemberRestrict 

	* [x]  ChatMemberPromote 

	* [x]  InlineKeyboardButton 

	* [x]  ReplyMarkup 

	* [x]  EmptyReplyMarkup 

	* [x]  InlineKeyboardMarkup 

	* [x]  ReplyKeyboardMarkup 

	* [x]  ReplyKeyboardRemove 

	* [x]  ForceReply 

	* [x]  InlineQueryResult 

	* [x]  InlineQueryResultAudio 

	* [x]  InlineQueryResultArticle 

	* [x]  InlineQueryResultContact 

	* [x]  InlineQueryResultGame 

	* [x]  InlineQueryResultDocument 

	* [x]  InlineQueryResultGif 

	* [x]  InlineQueryResultLocation 

	* [x]  InlineQueryResultMpeg4Gif 

	* [x]  InlineQueryResultPhoto 

	* [x]  InlineQueryResultVenue 

	* [x]  InlineQueryResultVideo 

	* [x]  InlineQueryResultVoice 
	
	* [x]  InlineQueryResultCachedAudio 

	* [x]  InlineQueryResultCachedDocument 

	* [x]  InlineQueryResultCachedGif 

	* [x]  InlineQueryResultCachedMpeg4Gif 

	* [x]  InlineQueryResultCachedPhoto 

	* [x]  InlineQueryResultCachedSticker 

	* [x]  InlineQueryResultCachedVideo 

	* [x]  InlineQueryResultCachedVoice 

	* [x]  InputMessageContent 

	* [x]  InputTextMessageContent 

	* [x]  InputLocationMessageContent 

	* [x]  InputContactMessageContent 

	* [x]  InputVenueMessageContent 

	* [x]  LabeledPrice 

	* [x]  Invoice 

	* [x]  ShippingOption 

 * API Methods [ directory: *include/tgbot/methods* ]

	* [x]  addStickerToSet

	* [x]  answerCallbackQuery

	* [x]  answerInlineQuery

	* [x]  answerPreCheckoutQuery

	* [x]  answerShippingQuery

	* [x]  createNewStickerSet

	* [x]  deleteChatPhoto

	* [x]  deleteMessage

	* [x]  deleteStickerFromSet

	* [x]  deleteWebhook

	* [x]  editMessageCaption

	* [x]  editMessageReplyMarkup

	* [x]  editMessageText

	* [x]  exportChatInviteLink

	* [x]  forwardMessage

	* [x]  getChat

	* [x]  getChatAdministrators

	* [x]  getChatMember

	* [x]  getChatMembersCount

	* [x]  getFile

	* [x]  getGameHighScores

	* [x]  getMe

	* [x]  getStickerSet

	* [x]  getUserProfilePhotos

	* [x]  getWebhookInfo

	* [x]  kickChatMember

	* [x]  leaveChat

	* [x]  pinChatMessage

	* [x]  promoteChatMember

	* [x]  restrictChatMember

	* [x]  sendAudio

	* [x]  sendChatAction

	* [x]  sendContact

	* [x]  sendDocument

	* [x]  sendGame

	* [x]  sendInvoice

	* [x]  sendLocation

	* [x]  sendMessage

	* [x]  sendPhoto

	* [x]  sendSticker

	* [x]  sendVenue

	* [x]  sendVideo

	* [x]  sendVideoNote

	* [x]  sendVoice

	* [x]  setChatDescription

	* [x]  setChatPhoto

	* [x]  setChatTitle

	* [x]  setGameScore

	* [x]  setStickerPositionInSet
	
	* [x]  setWebhook

	* [x]  unbanChatMember

	* [x]  unpinChatMessage

	* [x]  uploadStickerFile

### The dark side of Inline Query answers

After we recieve our inline query, we have to answer it, done using *answerInlineQuery* method.

answerInlineQuery accepts the following **parameter**: *std::vector<::tgbot::types::Ptr<InlineQueryResult>> const&*

Because of project structure we have to use a smart pointer (**std::unique_ptr**), each specific result is a derived class of InlineQueryResult.

```c++
#include <tgbot/bot.h>
#include <tgbot/utils/make_ptr.h>

using namespace tgbot;
using namespace types;
using namespace methods;
using namespace methods::types;

int main() {
	//alias provided by project headers
	InlineQueryResultsVector results;
	
	//first result
	Ptr<InlineQueryResultPhoto> photo = utils::makePtr<InlineQueryResultPhoto>();
	photo->type = iqrTypePhoto; //also iqrTypeAudio, iqrType<type> exist
	photo->id = "unique_identifier";

	//put first result in the container
	results.push_back(std::move(photo));

	//repeat this each time it is required

	//use results with answerInlineQuery
}
```