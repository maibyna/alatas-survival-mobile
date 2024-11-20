import 'package:flutter/material.dart';
import 'package:alatas_survival/models/al_entry.dart';
import 'package:alatas_survival/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert'; // Tambahkan ini di bagian import

class AlEntryPage extends StatefulWidget {
  const AlEntryPage({super.key});

  @override
  State<AlEntryPage> createState() => _AlEntryPageState();
}

class _AlEntryPageState extends State<AlEntryPage> {
  Future<List<AlEntry>> fetchAlEntry(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response; 
    
    // Melakukan konversi data json menjadi object MoodEntry
    List<AlEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(AlEntry.fromJson(d));
      }
    }
    return listProduct;
  }


  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alatas Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchAlEntry(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Terjadi kesalahan: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada data produk pada Alatas Survival.',
                style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                final entry = snapshot.data![index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text("User ID: ${entry.user}"),
                      Text("Time: ${entry.time}"),
                      Text("Price: \$${entry.price}"),
                      Text("Description: ${entry.description}"),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),

    );
  }
}