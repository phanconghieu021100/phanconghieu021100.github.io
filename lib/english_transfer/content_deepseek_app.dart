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

const List<SentenceSet> allSentenceSets = [deepSeekSet, techSet];
