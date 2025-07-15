const List<SentenceSet> allSentenceSets = [
  deepSeekSet,
  techSet,
  memoriesSet,
  mostDifficultLanguageSet,
  idiomsSet,
  pursuitOfHappynessSet,
  richnessSet
];

class SentenceSet {
  final String title;
  final List<String> englishSentences;
  final List<String> vietnameseSentences;

  const SentenceSet({
    required this.title,
    required this.englishSentences,
    required this.vietnameseSentences,
  });
}

const SentenceSet deepSeekSet = SentenceSet(
  title: "DeepSeek App",
  englishSentences: [
    "DeepSeek App is an advanced AI-powered platform designed to enhance searching, analysis, and data processing.",
    "It utilizes cutting-edge technology to provide users with accurate and deep insights.",
    "DeepSeek is popular for its ability to perform smart data analysis and advanced search algorithms.",
    "Users can leverage DeepSeek for research, investment analysis, and trend detection.",
    "With a user-friendly interface, it allows individuals and businesses to gain deeper insights and make data-driven decisions.",
    "Whether used for personal learning or corporate strategy, DeepSeek is a powerful tool for exploring complex data and generating intelligent insights.",
  ],
  vietnameseSentences: [
    "Ứng dụng DeepSeek là một nền tảng tiên tiến được hỗ trợ bởi AI, được thiết kế để nâng cao khả năng tìm kiếm, phân tích và xử lý dữ liệu.",
    "Nó sử dụng công nghệ tiên tiến để cung cấp cho người dùng những thông tin chính xác và sâu sắc.",
    "DeepSeek nổi tiếng nhờ vào khả năng thực hiện phân tích dữ liệu thông minh cùng với các thuật toán tìm kiếm tiên tiến.",
    "Người dùng có thể tận dụng DeepSeek để nghiên cứu, phân tích đầu tư và phát hiện xu hướng.",
    "Với giao diện thân thiện, nó giúp cá nhân và doanh nghiệp đưa ra quyết định dựa trên dữ liệu.",
    "Dù dùng để học tập cá nhân hay chiến lược doanh nghiệp, DeepSeek là công cụ mạnh mẽ khám phá dữ liệu và tạo ra góc nhìn thông minh.",
  ],
);

const SentenceSet techSet = SentenceSet(
  title: "The latest tech",
  englishSentences: [
    "The latest tech gadgets offer innovative solutions and convenience for everyday life.",
    "Smart home devices such as voice-controlled assistants and automated lighting enhance living spaces and improve efficiency.",
    "Wearable technology like fitness trackers and smartwatches provides real-time health monitoring and connectivity.",
    "Cutting-edge smartphones now feature powerful cameras and AI capabilities that transform how we capture and interact with the world.",
    "Wireless earbuds offer superior sound quality and freedom from cords.",
    "These gadgets not only make our lives more convenient and connected but also push the boundaries of technology, continuously shaping our digital experience."
  ],
  vietnameseSentences: [
    "Các thiết bị công nghệ mới nhất mang đến các giải pháp và sự tiện lợi sáng tạo cho cuộc sống hằng ngày.",
    "Thiết bị nhà thông minh như trợ lý điều khiển bằng giọng nói và đèn tự động nâng cao không gian sống và cải thiện hiệu quả.",
    "Công nghệ đeo như máy theo dõi sức khỏe và đồng hồ thông minh cung cấp theo dõi sức khỏe theo thời gian thực và kết nối.",
    "Điện thoại thông minh tiên tiến nay có camera mạnh mẽ và khả năng AI biến đổi cách chúng ta ghi lại và tương tác với thế giới.",
    "Tai nghe không dây mang lại chất lượng âm thanh vượt trội và sự tự do khỏi dây.",
    "Những thiết bị này không chỉ làm cho cuộc sống của chúng ta tiện lợi và kết nối hơn mà còn đẩy xa giới hạn của công nghệ, liên tục định hình trải nghiệm kỹ thuật số của chúng ta."
  ],
);

const SentenceSet pursuitOfHappynessSet =
    SentenceSet(title: "Pursuit of Happyness", englishSentences: [
  "The Pursuit of Happyness is a powerful theme that highlights the struggles and triumphs of achieving goals.",
  "Inspired by the true story of Chris Gardner, this journey showcases how determination, hard work, and perseverance can overcome adversity.",
  "Chris Gardner faced homelessness, financial struggles, and career challenges, but he never gave up.",
  "Through his unwavering spirit, he became a successful stockbroker and a symbol of hope.",
  "The phrase 'pursuit of happyness' implies that happiness is not given, but achieved through effort.",
  "It teaches that success is not measured by money, but by one's ability to overcome challenges.",
  "True richness is not just how much money one has, but also the quality of life, health, relationships, and personal fulfillment.",
  "Some people measure richness by their possessions, while others consider richness as having meaningful experiences and deep connections.",
  "Healthy friendships and family bonds often bring more joy than material wealth.",
  "Achieving a balance between financial stability and emotional well-being can lead to a fulfilling life.",
  "The richest people are often those who appreciate life, share with others, and find contentment in the present moment."
], vietnameseSentences: [
  "Mưu cầu hạnh phúc là một chủ đề mạnh mẽ nhấn mạnh những khó khăn và chiến thắng trong việc đạt được mục tiêu.",
  "Lấy cảm hứng từ câu chuyện có thật của Chris Gardner, hành trình này cho thấy sự quyết tâm, làm việc chăm chỉ và kiên trì có thể vượt qua nghịch cảnh.",
  "Chris Gardner đã đối mặt với tình trạng vô gia cư, khó khăn tài chính và thách thức nghề nghiệp, nhưng ông không bao giờ bỏ cuộc.",
  "Nhờ vào tinh thần kiên định của mình, ông đã trở thành một nhà môi giới chứng khoán thành công và là biểu tượng của hy vọng.",
  "Cụm từ 'mưu cầu hạnh phúc' ngụ ý rằng hạnh phúc không tự nhiên có mà phải đạt được bằng sự nỗ lực.",
  "Nó dạy rằng thành công không được đo lường bằng tiền bạc, mà bởi khả năng vượt qua thử thách.",
  "Sự giàu có thực sự không chỉ là số tiền một người sở hữu, mà còn là chất lượng cuộc sống, sức khỏe, các mối quan hệ và sự mãn nguyện cá nhân.",
  "Một số người đánh giá sự giàu có bằng tài sản họ sở hữu, trong khi những người khác coi sự giàu có là có những trải nghiệm ý nghĩa và các mối quan hệ sâu sắc.",
  "Tình bạn lành mạnh và sự gắn kết gia đình thường mang lại niềm vui hơn là sự giàu có vật chất.",
  "Đạt được sự cân bằng giữa sự ổn định tài chính và sức khỏe tinh thần có thể mang lại một cuộc sống viên mãn.",
  "Những người giàu có nhất thường là những người biết trân trọng cuộc sống, chia sẻ với người khác và tìm thấy sự hài lòng trong hiện tại."
]);

const SentenceSet memoriesSet = SentenceSet(
  title: "Memories are important",
  englishSentences: [
    "Memories are important because they shape our identity.",
    "They help us learn from the past, create emotional connections, and build relationships.",
    "Special moments with family and friends form a lifelong bond.",
    "Memories of success motivate us, while lessons from failures make us wiser.",
    "They preserve cultural history and help us understand our roots.",
    "Without memories, we would lose a sense of self and purpose.",
    "Memories are the stories that bring meaning and joy to our lives."
  ],
  vietnameseSentences: [
    "Ký ức rất quan trọng vì chúng hình thành nên bản sắc của chúng ta.",
    "Chúng giúp chúng ta học từ quá khứ, tạo nên những kết nối cảm xúc, và xây dựng các mối quan hệ.",
    "Những khoảnh khắc đặc biệt với gia đình và bạn bè tạo nên sự gắn kết suốt đời.",
    "Ký ức về thành công truyền động lực cho chúng ta, còn bài học từ thất bại giúp chúng ta khôn ngoan hơn.",
    "Chúng lưu giữ lịch sử văn hóa và giúp chúng ta hiểu về nguồn cội.",
    "Nếu không có ký ức, chúng ta sẽ mất đi cảm giác về bản thân và mục đích.",
    "Ký ức là những câu chuyện mang lại ý nghĩa và niềm vui cho cuộc sống chúng ta."
  ],
);

const SentenceSet mostDifficultLanguageSet = SentenceSet(
  title: "The most difficult language",
  englishSentences: [
    "The most difficult language in the world depends on various factors, such as grammar, pronunciation, and script.",
    "Mandarin Chinese is often considered the toughest due to its complex tonal system and thousands of characters.",
    "Arabic is difficult because of its unique script, complex grammar, and words that change form based on context.",
    "Japanese has three writing systems: Kanji, Hiragana and Katakana, making it difficult to master.",
    "Russian has complex grammatical cases, while Hungarian has 18 grammatical cases.",
    "Though some languages are more complex, the difficulty depends on a person's native language."
  ],
  vietnameseSentences: [
    "Ngôn ngữ khó nhất thế giới phụ thuộc vào nhiều yếu tố, như ngữ pháp, phát âm và chữ viết.",
    "Tiếng Trung Quan thoại thường được coi là khó nhất vì hệ thống thanh điệu phức tạp và hàng nghìn ký tự.",
    "Tiếng Ả Rập khó vì hệ chữ viết độc đáo, ngữ pháp phức tạp, và từ ngữ thay đổi hình thức tùy theo ngữ cảnh.",
    "Tiếng Nhật có ba hệ chữ viết: Kanji, Hiragana và Katakana, khiến nó khó để thành thạo.",
    "Tiếng Nga có các dạng ngữ pháp phức tạp, trong khi tiếng Hungary có 18 cách chia từ.",
    "Dù một số ngôn ngữ phức tạp hơn, độ khó còn phụ thuộc vào ngôn ngữ mẹ đẻ của mỗi người."
  ],
);

const SentenceSet idiomsSet = SentenceSet(
  title: "Idioms",
  englishSentences: [
    "Idioms are common phrases or expressions whose meaning can's be literally interpreted.",
    "They often convey deeper meanings and add color to language.",
    "Examples include 'break a leg', 'hit the nail on the head', and 'between a rock and a hard place'.",
    "Each language has its own idioms, and they often reflect cultural history and common life experiences.",
    "Learning idioms can help improve language fluency and make conversations more natural."
  ],
  vietnameseSentences: [
    "Thành ngữ là những cụm từ hoặc cách diễn đạt phổ biến mà không thể hiểu theo nghĩa đen.",
    "Chúng thường truyền tải ý nghĩa sâu sắc hơn và làm cho ngôn ngữ sinh động hơn.",
    "Ví dụ bao gồm 'break a leg' (chúc may mắn), 'hit the nail on the head' (nói đúng trọng tâm), và 'between a rock and a hard place' (ở trong tình thế khó khăn).",
    "Mỗi ngôn ngữ đều có thành ngữ riêng, và chúng thường phản ánh lịch sử văn hóa cùng những trải nghiệm cuộc sống.",
    "Học thành ngữ có thể giúp nâng cao khả năng ngôn ngữ và làm cho cuộc hội thoại tự nhiên hơn."
  ],
);

const SentenceSet richnessSet = SentenceSet(
  title: "Richness",
  englishSentences: [
    "Richness is often associated with financial wealth, but it encompasses much more.",
    "True richness is not just how much money one has, but also the quality of life, health, relationships, and personal fulfillment.",
    "Some people measure richness by their possessions, while others consider richness as having meaningful experiences and deep connections.",
    "Healthy friendships and family bonds often bring more joy than material wealth.",
    "Achieving a balance between financial stability and emotional well-being can lead to a fulfilling life.",
    "The richest people are often those who appreciate life, share with others, and find contentment in the present moment."
  ],
  vietnameseSentences: [
    "Sự giàu có thường gắn liền với sự giàu về tài chính, nhưng nó bao hàm nhiều khía cạnh hơn thế.",
    "Sự giàu có thực sự không chỉ là số tiền một người sở hữu, mà còn là chất lượng cuộc sống, sức khỏe, các mối quan hệ và sự mãn nguyện cá nhân.",
    "Một số người đánh giá sự giàu có bằng tài sản họ sở hữu, trong khi những người khác coi sự giàu có là có những trải nghiệm ý nghĩa và các mối quan hệ sâu sắc.",
    "Tình bạn lành mạnh và sự gắn kết gia đình thường mang lại niềm vui hơn là sự giàu có vật chất.",
    "Đạt được sự cân bằng giữa sự ổn định tài chính và sức khỏe tinh thần có thể mang lại một cuộc sống viên mãn.",
    "Những người giàu có nhất thường là những người biết trân trọng cuộc sống, chia sẻ với người khác và tìm thấy sự hài lòng trong hiện tại."
  ],
);
