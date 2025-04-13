import 'package:beansocial/footerr.dart';
import 'package:beansocial/giris_kontrol.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'header.dart';

class ProfilePage extends StatefulWidget {
  final String userName;

  const ProfilePage({super.key, required this.userName});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

enum MenuOption { updateInfo, myCoffees, myRecipes, logout }

class _ProfilePageState extends State<ProfilePage> {
  MenuOption _selected = MenuOption.updateInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No default AppBar: using custom Header widget
      body: Column(
        children: [
          // Üst header
          const Header(),
          // Ana içerik
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  // Sol gezinme menüsü
                  Container(
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.person,
                                size: 40, color: Colors.brown[400]),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.userName,
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                          ),
                          const Divider(height: 32),
                          _buildMenuItem(Icons.edit, 'Bilgileri Güncelle',
                              MenuOption.updateInfo),
                          _buildMenuItem(Icons.local_cafe, 'Kahvelerim',
                              MenuOption.myCoffees),
                          _buildMenuItem(Icons.receipt_long, 'Tariflerim',
                              MenuOption.myRecipes),
                          const Spacer(),
                          _buildMenuItem(
                              Icons.logout, 'Çıkış Yap', MenuOption.logout,
                              isLogout: true),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 24),

                  // Sağ içerik
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: _buildContent(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Alt footer
          const Footerr(
            children: [],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, MenuOption option,
      {bool isLogout = false}) {
    final selected = _selected == option;
    return ListTile(
      leading:
          Icon(icon, color: selected ? Colors.brown[700] : Colors.grey[600]),
      title: Text(
        label,
        style: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          color: selected ? Colors.brown[700] : Colors.grey[800],
        ),
      ),
      selected: selected,
      selectedTileColor: Colors.brown[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () {
        if (isLogout) {
          _onLogout();
        } else {
          setState(() => _selected = option);
        }
      },
    );
  }

  Widget _buildContent() {
    switch (_selected) {
      case MenuOption.updateInfo:
        return UpdateInfoSection(userName: widget.userName);
      case MenuOption.myCoffees:
        return MyCoffeesSection();
      case MenuOption.myRecipes:
        return MyRecipesSection();
      case MenuOption.logout:
        return Center(
            child: Text('Çıkış için menüden devam edin.',
                style: GoogleFonts.nunito()));
    }
  }

  void _onLogout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Çıkış Yap', style: GoogleFonts.nunito()),
        content: Text('Çıkış yapmak istediğinize emin misiniz?',
            style: GoogleFonts.nunito()),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('İptal', style: GoogleFonts.nunito())),
          TextButton(
            onPressed: () async {
              // Gerçek çıkış işlemi
              await AuthService.logout();
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text('Evet', style: GoogleFonts.nunito()),
          ),
        ],
      ),
    );
  }
}

class UpdateInfoSection extends StatelessWidget {
  final String userName;
  const UpdateInfoSection({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bilgileri Güncelle',
            style:
                GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildField('Kullanıcı Adı', userName),
        const SizedBox(height: 12),
        _buildField('E-posta', ''),
        const SizedBox(height: 12),
        _buildField('Telefon', ''),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown[700],
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text('Kaydet',
              style: GoogleFonts.nunito(fontSize: 16, color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildField(String label, String value) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: value.isNotEmpty ? value : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class MyCoffeesSection extends StatelessWidget {
  final List<String> coffees = ['Espresso', 'Latte', 'Cappuccino', 'Americano'];

  MyCoffeesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Kahvelerim',
            style:
                GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemCount: coffees.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (ctx, i) => Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.local_cafe, color: Colors.brown[400]),
                title: Text(coffees[i], style: GoogleFonts.nunito()),
                trailing: IconButton(
                  icon:
                      const Icon(Icons.delete_outline, color: Colors.redAccent),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyRecipesSection extends StatelessWidget {
  final List<String> recipes = [
    'Vanilla Latte Tarifi',
    'Mocha Tarifi',
    'Cold Brew Tarifi'
  ];

  MyRecipesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tariflerim',
            style:
                GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemCount: recipes.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (ctx, i) => Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.receipt, color: Colors.brown[400]),
                title: Text(recipes[i], style: GoogleFonts.nunito()),
                trailing: IconButton(
                  icon:
                      const Icon(Icons.edit_outlined, color: Colors.blueAccent),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
