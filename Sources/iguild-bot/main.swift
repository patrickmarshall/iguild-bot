import TelegramBotSDK

let token = readToken(from: "BOT_TOKEN")
let bot = TelegramBot(token: token)

let router = Router(bot: bot)

router["greet"] = { context in
    guard let from = context.message?.from else { return false }
    context.respondAsync("Hello! \(from.firstName)")
    return true
}

router["random"] = { context in
    let text = Int.random(in: 0...1000)
    context.respondAsync("\(text)")
    
    return true
}

router[.photo] = { context in
    let chatId = ChatId.chat((context.message?.chat.id) ?? 0)
    let img = InputFileOrString.string((context.message?.photo?.last?.fileId) ?? "")
    bot.sendPhotoAsync(chatId: chatId, photo: img)
    return true
}



while let update = bot.nextUpdateSync() {
    print(update)
    try router.process(update: update)
}
