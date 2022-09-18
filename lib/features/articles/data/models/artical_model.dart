// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Article {
  final num? id;
  final String? title;
  final String? content;
  final String? byline;
  final List<Media>? media;
  final DateTime? publishedDate;
  Article({
    this.id,
    this.title,
    this.content,
    this.byline,
    this.media,
    this.publishedDate,
  });

  Article copyWith({
    num? id,
    String? title,
    String? content,
    String? byline,
    List<Media>? media,
    DateTime? publishedDate,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      byline: byline ?? this.byline,
      media: media ?? this.media,
      publishedDate: publishedDate ?? this.publishedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'byline': byline,
      'media': media!.map((x) => x.toMap()).toList(),
      'published_date': publishedDate?.toIso8601String(),
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] != null ? map['id'] as num : null,
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      byline: map['byline'] != null ? map['byline'] as String : null,
      media: map['media'] != null
          ? List<Media>.from(
              (map['media'] as List<int>)
                  .map<Media?>((x) => Media.fromMap(x as Map<String, dynamic>)),
            )
          : null,
      publishedDate: map['published_date'] != null
          ? DateTime.tryParse(map['published_date'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(id: $id, title: $title, content: $content, byline: $byline, media: $media, published_date: $publishedDate)';
  }

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.content == content &&
        other.byline == byline &&
        listEquals(other.media, media) &&
        other.publishedDate == publishedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        byline.hashCode ^
        media.hashCode ^
        publishedDate.hashCode;
  }
}

class Media {
  final List<_MetaData> metadata;
  Media({
    required this.metadata,
  });

  Media copyWith({
    List<_MetaData>? metadata,
  }) {
    return Media(
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'media-metadata': metadata.map((x) => x.toMap()).toList(),
    };
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      metadata: List<_MetaData>.from(
        (map['metadata'] as List<int>).map<_MetaData>(
          (x) => _MetaData.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Media.fromJson(String source) =>
      Media.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Media(metadata: $metadata)';

  @override
  bool operator ==(covariant Media other) {
    if (identical(this, other)) return true;

    return listEquals(other.metadata, metadata);
  }

  @override
  int get hashCode => metadata.hashCode;
}

class _MetaData {
  final String? url;
  final double? width;
  final double? height;
  _MetaData({
    this.url,
    this.width,
    this.height,
  });

  _MetaData copyWith({
    String? url,
    double? width,
    double? height,
  }) {
    return _MetaData(
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
    };
  }

  factory _MetaData.fromMap(Map<String, dynamic> map) {
    return _MetaData(
      url: map['url'] != null ? map['url'] as String : null,
      width: map['width'] != null ? map['width'] as double : null,
      height: map['height'] != null ? map['height'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory _MetaData.fromJson(String source) =>
      _MetaData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '_MetaData(url: $url, width: $width, height: $height)';

  @override
  bool operator ==(covariant _MetaData other) {
    if (identical(this, other)) return true;

    return other.url == url && other.width == width && other.height == height;
  }

  @override
  int get hashCode => url.hashCode ^ width.hashCode ^ height.hashCode;
}
