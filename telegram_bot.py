import os
import telebot

# Đọc token từ biến môi trường hoặc GitHub Secrets
bot_token = os.environ.get('BOT_TOKEN')  # Sử dụng os.environ để đọc từ biến môi trường
bot = telebot.TeleBot(bot_token)

# Xử lý lệnh /start
@bot.message_handler(commands=['start'])
def send_welcome(message):
    bot.reply_to(message, "Xin chào! Tôi là bot Telegram của bạn.")

# Hàm này xử lý tất cả các tin nhắn khác
@bot.message_handler(func=lambda message: True)
def echo_all(message):
    bot.reply_to(message, "Xin lỗi, tôi không hiểu lệnh này. Để bắt đầu, hãy nhấn /start.")

# Bắt đầu lắng nghe các tin nhắn
bot.polling()
