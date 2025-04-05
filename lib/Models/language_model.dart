class LanguageModel {
  String? language;
  String? sublanguage;
  String? languagecode;

  LanguageModel(
      {required this.language,
      required this.languagecode,
      required this.sublanguage});
}

List<LanguageModel> get languageModel => [
      LanguageModel(
          language: "English", languagecode: "en", sublanguage: "English"),
      LanguageModel(
          language: "Swahili", languagecode: "sw", sublanguage: "Swahili"),
    ];
