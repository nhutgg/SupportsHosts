import telebot
from telebot.types import InlineKeyboardMarkup, InlineKeyboardButton

# Thay thế 'YOUR_BOT_TOKEN' bằng token thực tế bạn nhận được từ BotFather
bot = telebot.TeleBot('xxx')

@bot.message_handler(commands=['start', 'help'])
def send_welcome(message):
    # Đây là một xử lý sự kiện commands, bạn có thể giữ nó cho các tác vụ khác
    pass

@bot.message_handler(func=lambda message: True)
def echo_all(message):
    # Đây là một xử lý sự kiện để xử lý tin nhắn từ tất cả người dùng
    pass

@bot.message_handler(content_types=['new_chat_members'])
def welcome_new_members(message):
    for user in message.new_chat_members:
        markup = InlineKeyboardMarkup(row_width=1)
        dns_button = InlineKeyboardButton("DNS FREE 14.10 UPDATE", callback_data='dns')
        fix_button = InlineKeyboardButton("Cài Cẩu Hình DNS PRO", callback_data='fix')
        check_button = InlineKeyboardButton("Fix ứng trong không có sẳn nữa", callback_data='check')
        other_button = InlineKeyboardButton("Thông báo từ DNS nên đọc", callback_data='other')
        other1_button = InlineKeyboardButton("File Chứng Chỉ IOS", callback_data='other1')
        markup.add(dns_button, fix_button, check_button, other_button,other1_button)
        
        # Sử dụng username nếu có hoặc first_name nếu không
        user_name = user.username if user.username else user.first_name
        welcome_message = "📣 Các bạn mới vào xem và đọc GHIM giúp mình !\n\n"
        welcome_message += "Để nhận dữ liệu và thông tin từ nhóm, hãy gõ các từ khoá trong dấu khoặc kép \"\" như sau:\n"
        welcome_message += "1️⃣ :\"dns\" lấy thông tin cấu hình DNS\n"
        welcome_message += "2️⃣ :\"fix\" xem video cách fix thường hay gặp phải\n"
        welcome_message += "3️⃣ \"check\" hướng dẫn fix ứng dụng không thể xác minh & ứng trong không có sẳn nữa👌\n"
        welcome_message += "4️⃣  \"file\" tổng hợp file chứng chỉ hiện tại\n"
        welcome_message += "5️⃣  \"ghichudns\" hướng dẫn dùng cách bật điều chỉnh khi dùng DNS"

        bot.send_message(message.chat.id, welcome_message, reply_markup=markup)

@bot.callback_query_handler(func=lambda call: True)
def handle_callback_query(call):
    if call.data == 'dns':
        bot.send_message(call.message.chat.id, "DNS FREE 14.10 UPDATE:https://raw.githubusercontent.com/nhutnguyenminh2/nhutnguyenminh2.github.io/main/mobileconfig/DNS5_GG.mobileconfig")
    elif call.data == 'fix':
        bot.send_message(call.message.chat.id, "Cài Cẩu Hình DNS PRO: [Vượt link để tải cẩu hình pro dùng đến 12 tháng](https://web1s.asia/NhutGG/)")
    elif call.data == 'check':
        bot.send_message(call.message.chat.id, "Fix ứng trong không có sẳn nữa:(https://t.me/dnscert/605)")

    elif call.data == 'other1':
        bot.send_message(call.message.chat.id, "https://www.mediafire.com/folder/fdybkabjgt7mq/Cc")

        
    elif call.data == 'other':
        other_message = "📣Thông báo:🌐 DNS HIỆN TẠI đang rất là ổn nha, mọi người hạn chế đổi tới đổi lui giữa b1 & b2 or nhảy sang tự động nha apple quét cái là die hết cc hàng loạt đó !\n"
        other_message += "+ khi dùng dns vẫn cài cc die cài ứng dụng binh thường kệ đừng quan tâm là đang sống or chết .\n"
        other_message += "lí do tại sao dùng DNS?\n"
        other_message += "➡️Vì khi bạn sữ dụng chứng chỉ free thì có thể cài và dùng bình thường nhưng thời gian dùng ngắn có thể từ 5 đến 7 ngày, nhưng khi dùng DNS thì nó chặn các tên miền của apple nên thời gian dùng lâu hơn ổn định hơn có thể kéo dài vài tháng chả sao. ⚠️lưu ý rằng khi sữ dụng DNS không được dùng VPN hoặc hack 4G Thì DNS này không dùng được .\n"
        other_message += "hướng dẫn chi tiết về DNS Nhóm:\n"
        other_message += "1️⃣.bắt đầu tải ứng dụng trực tiếp qua bất cứ nền tản nào thì mọi người chọn Bước 2.\n"
        other_message += "2️⃣.khi tải được ứng dụng tiếp theo là xác minh,xác thực tin cậy nếu thông báo thì vào chọn lại bước 1 rồi chuyển sang xác minh.\n"
        other_message += "3️⃣.sau khi xác minh xong vào được và dụng được ứng dụng nhớ chọn lại bước 2 để chặn thu hồi chứng chỉ bước này rất quan trọng  vì để dụng lâu dài đừng quên .\n"
        
        other_message += "👉link web cập nhập dns và nhiều chứng chỉ mới: [Link Web](https://nhutnguyenminh2.github.io/) ✅\n"
        other_message += "👉xem video nhân bản bằng chứng chỉ thu hồi https://youtu.be/JGt_Ew8CRSs"

        bot.send_message(call.message.chat.id, other_message)

bot.polling()
