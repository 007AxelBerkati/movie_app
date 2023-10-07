import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/components/card_latest_upload.dart';
import 'package:movie_app/detail_screen.dart';
import 'package:movie_app/model/movie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  Timer? _debounce;

  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _searchQuery = value; // Update query pencarian saat input berubah
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              onChanged: _onSearchChanged,
              decoration: const InputDecoration(
                  labelText: 'Cari Movie',
                  hintText: 'Masukkan judul aplikasi',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child:
                    _buildSearchResults()), // Widget untuk menampilkan hasil pencarian
            // Widget untuk menampilkan hasil pencarian
          ),
        ],
      ),
    ));
  }

  Widget _buildSearchResults() {
    final List<Movie> movie = movieList;

    final filteredApps = movie.where((movie) {
      final titleLower = movie.title.toLowerCase();
      final searchLower = _searchQuery.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    // Membangun daftar hasil pencarian
    return ListView.builder(
      itemCount: filteredApps.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(movie: filteredApps[index])));
            },
            child: CardLatestUpload(
              movie: filteredApps[index],
            ));
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
