import 'package:flutter/material.dart';


import '../../models/todo_item.dart';
import '../../services/photo_album_service.dart';

class PhotoAlbumScreen extends StatefulWidget {
  const PhotoAlbumScreen({super.key});

  @override
  State<PhotoAlbumScreen> createState() => _PhotoAlbumScreenState();
}

class _PhotoAlbumScreenState extends State<PhotoAlbumScreen> {
  final PhotoAlbumService _photoAlbumService = PhotoAlbumService();
  List<PhotoAlbum> _albums = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final albums = await _photoAlbumService.getPhotoAlbums();
    setState(() {
      _albums = albums;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Albums'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _albums.length,
        itemBuilder: (context, index) {
          final album = _albums[index];
          return Card(
            margin: const EdgeInsets.all(4.0),
            child: ListTile(
              title: Text(album.title),
              subtitle: Container(
                padding: const EdgeInsets.all(3.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 240, 140, 215), 
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Album ID: ',
                          ),
                          Text(
                            album.id.toString(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 132, 222, 240), 
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'User ID: ',
                          ),
                          Text(
                            album.userId.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}