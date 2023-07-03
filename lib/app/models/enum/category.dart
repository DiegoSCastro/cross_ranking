enum Category {
  scaled,
  rx,
  elite,
}

extension CategoryEx on String {
  Category toCategory() {
    switch (toLowerCase()) {
      case 'scaled':
        return Category.scaled;
      case 'rx':
        return Category.rx;
      case 'elite':
        return Category.elite;
      default:
        return Category.scaled;
    }
  }
}
