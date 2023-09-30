
class News
{

  String? _sourceName;
  String? _author;
  String? _title;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  get getSourceName => _sourceName;
  get getAuthor => _author;
  get getTitle => _title;
  get getUrl => _url;
  get getUrlToImage => _urlToImage;
  get getPublishedAt => _publishedAt;
  get getContent => _content;

  News();

  News.FactoryObj(
      this._sourceName,
      this._author,
      this._title,
      this._url,
      this._urlToImage,
      this._publishedAt,
      this._content
      );

  factory News.fromMap(Map<String, dynamic> data)
  {
    return News.FactoryObj(
      data["source"]["name"],
      data["author"],
      data["title"],
      data["url"],
      data["urlToImage"],
      data["publishedAt"],
      data["content"]
    );
  }
}