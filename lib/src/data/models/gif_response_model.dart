import 'package:gifs_app/src/data/models/data_model.dart';
import 'package:gifs_app/src/data/models/images_model.dart';

class GifResponse {
  List<DataModel>? data;
  Pagination? pagination;
  Meta? meta;

  GifResponse({this.data, this.pagination, this.meta});

  GifResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(DataModel.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}
