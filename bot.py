import os
import telebot

# Đọc token từ biến môi trường
token = os.environ['BOT_TOKEN']

bot = telebot.TeleBot(token)

@bot.message_handler(commands=['start'])
def send_welcome(message):
    bot.reply_to(message, "Xin chào, mình là trợ lý DNS! Gõ các từ khóa sau để nhận thông tin:\n" + ", ".join(keywords))

@bot.message_handler(func=lambda message: True)
def echo_all(message):
    text = message.text.lower()
    for keyword in keywords:
        if keyword in text:
            if keyword == "dns":
                reply_text = """
                Đây là danh sách tên miền đã block:
                1. googlesyndication.com
                2. usetrust.com
                3. sectigo.com
                4. ocsp03.apple.com
                5. letsencrypt.org
                6. iadsdk.apple.com
                7. ocsp-lb.apple.com.akadns.net
                """
                bot.reply_to(message, reply_text)
                return
            # Các trường hợp xử lý khác ở đây

# Xác định danh sách từ khóa
keywords = ["dns", "config", "help", "info"]

if __name__ == '__main__':
    bot.polling(none_stop=True)
