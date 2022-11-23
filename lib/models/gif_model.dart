import 'package:gifs_app/models/images_model.dart';

class GifModel {
  String? type;
  String? id;
  String? url;
  String? slug;
  String? bitlyGifUrl;
  String? bitlyUrl;
  String? embedUrl;
  String? username;
  String? source;
  String? title;
  String? rating;
  String? contentUrl;
  String? sourceTld;
  String? sourcePostUrl;
  int? isSticker;
  String? importDatetime;
  String? trendingDatetime;
  Images? images;
  String? analyticsResponsePayload;
  Analytics? analytics;
  User? user;

  GifModel({
    this.type,
    this.id,
    this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.isSticker,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
    this.analyticsResponsePayload,
    this.analytics,
    this.user,
  });

  GifModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    url = json['url'];
    slug = json['slug'];
    bitlyGifUrl = json['bitly_gif_url'];
    bitlyUrl = json['bitly_url'];
    embedUrl = json['embed_url'];
    username = json['username'];
    source = json['source'];
    title = json['title'];
    rating = json['rating'];
    contentUrl = json['content_url'];
    sourceTld = json['source_tld'];
    sourcePostUrl = json['source_post_url'];
    isSticker = json['is_sticker'];
    importDatetime = json['import_datetime'];
    trendingDatetime = json['trending_datetime'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    analyticsResponsePayload = json['analytics_response_payload'];
    analytics = json['analytics'] != null
        ? Analytics.fromJson(json['analytics'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['url'] = url;
    data['slug'] = slug;
    data['bitly_gif_url'] = bitlyGifUrl;
    data['bitly_url'] = bitlyUrl;
    data['embed_url'] = embedUrl;
    data['username'] = username;
    data['source'] = source;
    data['title'] = title;
    data['rating'] = rating;
    data['content_url'] = contentUrl;
    data['source_tld'] = sourceTld;
    data['source_post_url'] = sourcePostUrl;
    data['is_sticker'] = isSticker;
    data['import_datetime'] = importDatetime;
    data['trending_datetime'] = trendingDatetime;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['analytics_response_payload'] = analyticsResponsePayload;
    if (analytics != null) {
      data['analytics'] = analytics!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
