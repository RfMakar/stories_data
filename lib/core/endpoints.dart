abstract final class EndPoints {
  static const category = 'category/';
  static const categoryType = 'category_type/';
  static const categories = 'categories/';
  static const story = 'story/';
  static const storyPopular = 'story_popular/';
  static const search = 'search/';
  static const stats = 'stats/';
}

abstract final class ContentEndPoints {
  static const String generateText = '/generate/text';
  static const String generateImage = '/generate/image';
  static const String generateAudio = '/generate/audio';
}
