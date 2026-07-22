import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class PitWallConnectionWrapper extends StatefulWidget {
  final Widget child;

  const PitWallConnectionWrapper({super.key, required this.child});

  @override
  State<PitWallConnectionWrapper> createState() => _PitWallConnectionWrapperState();
}

class _PitWallConnectionWrapperState extends State<PitWallConnectionWrapper> {
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Check initial state on boot
  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      return;
    }
    if (!mounted) return;
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // If the device has no connection, show the Red Flag screen
    if (_connectionStatus.contains(ConnectivityResult.none)) {
      return _buildOfflineScreen();
    }

    // If connected, show your app normally
    return widget.child;
  }

  // ─── THE RED FLAG OFFLINE SCREEN ───
  Widget _buildOfflineScreen() {
    return Scaffold(
      backgroundColor: const Color(0xFF141414), // Dark F1 slate
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_off_rounded, color: Color(0xFFE10600), size: 80),
              const SizedBox(height: 30),
              const Text(
                "RED FLAG",
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  color: Color(0xFFE10600),
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4.0,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "CONNECTION LOST",
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "The telemetry feed requires an active network connection to display live engineering metrics and contact channels.\n\nPlease connect to Wi-Fi or Cellular to access the profile.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  color: Colors.white54,
                  fontSize: 12,
                  height: 1.6,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 50),
              const CircularProgressIndicator(color: Color(0xFFE10600)),
              const SizedBox(height: 20),
              const Text(
                "AWAITING SIGNAL...",
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  color: Colors.white38,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}