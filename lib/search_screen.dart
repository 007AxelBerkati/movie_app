import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/card_latest_upload.dart';
import 'package:movie_app/components/card_movie_web_page.dart';
import 'package:movie_app/detail_screen.dart';
import 'package:movie_app/model/movie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: kIsWeb
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
              child: SizedBox(
                  width: screenWidth <= 1200 ? 800 : 1200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: screenWidth * 0.3,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                          )),

                      SizedBox(
                        height: 300,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child:
                                _buildSearchResults()), // Widget untuk menampilkan hasil pencarian,
                      )

                      // Widget untuk menampilkan hasil pencarian
                    ],
                  )))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child:
                        _buildSearchResults()), // Widget untuk menampilkan hasil pencarian
                // Widget untuk menampilkan hasil pencarian
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
    return kIsWeb
        ? SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredApps.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(movie: filteredApps[index])));
                  },
                  child: CardMovieWebPage(
                    movie: filteredApps[index],
                  ),
                );
              },
            ),
          )
        : ListView.builder(
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
