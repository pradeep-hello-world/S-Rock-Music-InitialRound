import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_rock_initial_round/views/widgets/CustomBottomNavBar.dart';
import 'package:s_rock_initial_round/views/widgets/headerwidget.dart';
import 'package:s_rock_initial_round/views/widgets/middle_section_widget.dart';
import 'package:s_rock_initial_round/views/widgets/music_list_view.dart';
import '../view_model/music_services_view_model.dart';
import '../model/music_service.dart';


class MusicHomeScreen extends StatefulWidget {
  const MusicHomeScreen({Key? key}) : super(key: key);

  @override
  State<MusicHomeScreen> createState() => _MusicHomeScreenState();
}

class _MusicHomeScreenState extends State<MusicHomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MusicServicesViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: SafeArea(
        child: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const SizedBox(height: 16),
              const MiddleSectionWidget(),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Hire hand-picked Pros for popular music services',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                    MusicListView(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ...viewModel.services.map((service) => _buildServiceCard(
                context,
                service: service,
              )),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, {required MusicService service}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text(service.title)),
              body: Center(child: Text('You tapped on: ${service.title}')),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(service.iconPath, height: 40, width: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(service.description, style: const TextStyle(color: Colors.white60, fontSize: 13)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
          ],
        ),
      ),
    );
  }
}