import 'package:flutter/material.dart';
import 'package:bahrfitnesspro/services/meditation_service.dart';

class GuidedMeditationScreen extends StatefulWidget {
  const GuidedMeditationScreen({super.key});

  @override
  _GuidedMeditationScreenState createState() => _GuidedMeditationScreenState();
}

class _GuidedMeditationScreenState extends State<GuidedMeditationScreen> {
  final MeditationService _meditationService = MeditationService();
  List<String> _meditationTracks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMeditationTracks();
  }

  Future<void> _fetchMeditationTracks() async {
    try {
      List<String> tracks = await _meditationService.getMeditationTracks();
      setState(() {
        _meditationTracks = tracks;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching meditation tracks: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guided Meditation'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _meditationTracks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_meditationTracks[index]),
                  onTap: () {
                    // Play the selected meditation track
                  },
                );
              },
            ),
    );
  }
}
