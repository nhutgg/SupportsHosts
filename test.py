import telebot

# Replace 'YOUR_BOT_TOKEN' with the actual token you received from BotFather
bot = telebot.TeleBot('6437953172:AAEt8WJIHR2M4Io6yaQhFauE7rXVGMIjnGU')

# Danh sách các từ khóa
keywords = ["dns", "config", "help", "info"]  # Thêm các từ khóa khác nếu cần

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
            elif keyword == "config":
                # Phản hồi với thông tin cấu hình DNS
                bot.reply_to(message, "Thông tin cấu hình DNS...")
                return
            elif keyword == "help":
                # Phản hồi với hướng dẫn sử dụng
                bot.reply_to(message, "Hướng dẫn sử dụng...")
                return
            elif keyword == "info":
                # Phản hồi với thông tin khác
                bot.reply_to(message, "Thông tin khác...")
                return

    # Nếu không tìm thấy từ khóa nào, bot sẽ phản hồi mặc định
    #bot.reply_to(message, "Xin lỗi, không tìm thấy thông tin liên quan đến yêu cầu của bạn.")

bot.polling()
