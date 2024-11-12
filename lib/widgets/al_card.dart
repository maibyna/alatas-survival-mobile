import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alatas_survival/screens/menu.dart';
import 'package:alatas_survival/screens/alentry_form.dart';

class HoverableItemCard extends StatefulWidget {
  final ItemHomepage item;

  const HoverableItemCard(this.item, {super.key});

  @override
  _HoverableItemCardState createState() => _HoverableItemCardState();
}

class _HoverableItemCardState extends State<HoverableItemCard> {
  bool isHovered = false;

  // Fungsi untuk mendapatkan warna berdasarkan nama item
  Color _getItemColor(String itemName) {
    switch (itemName) {
      case "Lihat Daftar Produk":
        return Colors.cyanAccent[400] ?? Colors.blue;
      case "Tambah Produk":
        return Colors.lightBlue[400] ?? Colors.blue;
      case "Logout":
        return Colors.lightBlue[600] ?? Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    Matrix4 transform = Matrix4.identity();
    if (isHovered) {
      transform = Matrix4.identity()..scale(1.05);
    }

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: transform,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Kamu telah menekan tombol ${widget.item.name}!'),
                  duration: const Duration(seconds: 1),
                ),
              );
              if (widget.item.name == "Tambah Produk") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AlEntryFormPage(),
                    ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: _getItemColor(widget.item.name),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}
