enum Categories {
  examples("examples"), 
  definitions("definitions"), 
  topExample("topExample"),
  relatedWords("relatedWords"),
  pronunciations("pronunciations"),
  hyphenation("hyphenation"),
  frequency("frequency"),
  phrases("phrases"),
  etymologies("etymologies"),
  audio("audio");

  String value;
  
  private Categories(String value) {
    this.value = value;
  }
}