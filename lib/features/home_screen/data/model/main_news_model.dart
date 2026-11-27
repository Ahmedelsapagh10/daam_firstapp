import 'dart:convert';

MainNewsModel mainNewsModelFromJson(String source) =>
    MainNewsModel.fromJson(jsonDecode(source) as Map<String, dynamic>);

String mainNewsModelToJson(MainNewsModel model) => jsonEncode(model.toJson());

class MainNewsModel {
  final String? status;
  final int? totalResults;
  final List<Result>? results;
  final String? nextPage;

  const MainNewsModel({
    this.status,
    this.totalResults,
    this.results,
    this.nextPage,
  });

  factory MainNewsModel.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List<dynamic>?;

    return MainNewsModel(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      results:
          results
              ?.map((item) => Result.fromJson(item as Map<String, dynamic>))
              .toList() ??
          <Result>[],
      nextPage: json['nextPage'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'totalResults': totalResults,
    'results': results?.map((item) => item.toJson()).toList() ?? [],
    'nextPage': nextPage,
  };
}

class Result {
  final String? articleId;
  final String? link;
  final String? title;
  final String? description;
  final String? content;
  final List<String>? keywords;
  final List<String>? creator;
  final String? language;
  final List<String>? country;
  final List<String>? category;
  final String? datatype;
  final String? pubDate;
  final String? pubDateTz;
  final String? fetchedAt;
  final String? imageUrl;
  final dynamic videoUrl;
  final String? sourceId;
  final String? sourceName;
  final int? sourcePriority;
  final String? sourceUrl;
  final String? sourceIcon;
  final String? sentiment;
  final SentimentStats? sentimentStats;
  final List<String>? aiTag;
  final String? aiRegion;
  final String? aiOrg;
  final String? aiSummary;
  final bool? duplicate;

  const Result({
    this.articleId,
    this.link,
    this.title,
    this.description,
    this.content,
    this.keywords,
    this.creator,
    this.language,
    this.country,
    this.category,
    this.datatype,
    this.pubDate,
    this.pubDateTz,
    this.fetchedAt,
    this.imageUrl,
    this.videoUrl,
    this.sourceId,
    this.sourceName,
    this.sourcePriority,
    this.sourceUrl,
    this.sourceIcon,
    this.sentiment,
    this.sentimentStats,
    this.aiTag,
    this.aiRegion,
    this.aiOrg,
    this.aiSummary,
    this.duplicate,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    final stats = json['sentiment_stats'] as Map<String, dynamic>?;

    return Result(
      articleId: json['article_id'] as String?,
      link: json['link'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      keywords: _readStringList(json['keywords']),
      creator: _readStringList(json['creator']),
      language: json['language'] as String?,
      country: _readStringList(json['country']),
      category: _readStringList(json['category']),
      datatype: json['datatype'] as String?,
      pubDate: json['pubDate'] as String?,
      pubDateTz: json['pubDateTZ'] as String?,
      fetchedAt: json['fetched_at'] as String?,
      imageUrl: json['image_url'] as String?,
      videoUrl: json['video_url'],
      sourceId: json['source_id'] as String?,
      sourceName: json['source_name'] as String?,
      sourcePriority: json['source_priority'] as int?,
      sourceUrl: json['source_url'] as String?,
      sourceIcon: json['source_icon'] as String?,
      sentiment: json['sentiment'] as String?,
      sentimentStats: stats == null ? null : SentimentStats.fromJson(stats),
      aiTag: _readStringList(json['ai_tag']),
      aiRegion: json['ai_region'] as String?,
      aiOrg: json['ai_org'] as String?,
      aiSummary: json['ai_summary'] as String?,
      duplicate: json['duplicate'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'article_id': articleId,
    'link': link,
    'title': title,
    'description': description,
    'content': content,
    'keywords': keywords ?? <String>[],
    'creator': creator ?? <String>[],
    'language': language,
    'country': country ?? <String>[],
    'category': category ?? <String>[],
    'datatype': datatype,
    'pubDate': pubDate,
    'pubDateTZ': pubDateTz,
    'fetched_at': fetchedAt,
    'image_url': imageUrl,
    'video_url': videoUrl,
    'source_id': sourceId,
    'source_name': sourceName,
    'source_priority': sourcePriority,
    'source_url': sourceUrl,
    'source_icon': sourceIcon,
    'sentiment': sentiment,
    'sentiment_stats': sentimentStats?.toJson(),
    'ai_tag': aiTag ?? <String>[],
    'ai_region': aiRegion,
    'ai_org': aiOrg,
    'ai_summary': aiSummary,
    'duplicate': duplicate,
  };

  static List<String> _readStringList(Object? value) =>
      value == null ? <String>[] : List<String>.from(value as List<dynamic>);
}

class SentimentStats {
  final double? negative;
  final double? neutral;
  final double? positive;

  const SentimentStats({this.negative, this.neutral, this.positive});

  factory SentimentStats.fromJson(Map<String, dynamic> json) => SentimentStats(
    negative: (json['negative'] as num?)?.toDouble(),
    neutral: (json['neutral'] as num?)?.toDouble(),
    positive: (json['positive'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'negative': negative,
    'neutral': neutral,
    'positive': positive,
  };
}
