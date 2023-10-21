import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import '../models/todo_item.dart';

class PhotoAlbumService {
  final Dio _dio = Dio();

  Future<List<PhotoAlbum>> getPhotoAlbums() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/albums');

    if (response.statusCode == 200) {
      final jsonData = response.data;
      final encoder = JsonEncoder.withIndent(
          '  '); // ใช้ JsonEncoder พร้อมกับการเว้นระยะว่าง '  '
      final prettyPrinted = encoder.convert(jsonData);
      debugPrint(prettyPrinted); // แสดงข้อมูล JSON ในรูปแบบที่ถูกต้องในคอนโซล
      List<PhotoAlbum> albums = jsonData
          .map((json) => PhotoAlbum.fromJson(json))
          .cast<PhotoAlbum>()
          .toList();
      return albums;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
