enum ArticleType {
  education("education"),
  duUniversity("duUniversity"),
  fairLife("fairLife"),
  medicine("medicine");

  final String value;

  String get arabicValue {
    switch (value) {
      case "education":
        return "التربية والتعليم والتعليم العالى";
      case "duUniversity":
        return "جامعة دمياط";
      case "fairLife":
        return "مبادرة حياة كريمة";
      case "medicine":
        return "الصحة";

      default:
        return "فئه غير معلومه";
    }
  }

  const ArticleType(this.value);
}
