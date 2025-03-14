class languageModel {
  String? language;
  String? sublanguage;
  String? languagecode;

  languageModel(
      {required this.language,
      required this.languagecode,
      required this.sublanguage});
}

List<languageModel> get LanguageModel => [
      languageModel(
          language: "English", languagecode: "en", sublanguage: "English"),
      languageModel(
          language: "Swahili", languagecode: "sw", sublanguage: "Swahili"),
      languageModel(language: "हिंदी", languagecode: "hi", sublanguage: "Hindi")
    ];
