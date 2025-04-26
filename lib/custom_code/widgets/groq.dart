// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Groq extends StatefulWidget {
  const Groq({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Groq> createState() => _GroqState();
}

class _GroqState extends State<Groq> {
  String _response = '';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchPromptAndSendToGroq();
  }

  Future<void> _fetchPromptAndSendToGroq() async {
    try {
      // Fetch prompt from the 'users' collection; assumes there is at least one document
      final querySnapshot =
          await FirebaseFirestore.instance.collection('users').limit(1).get();

      if (querySnapshot.docs.isEmpty) {
        if (mounted) {
          setState(() {
            _response = 'No users found.';
            _loading = false;
          });
        }
        return;
      }

      final doc = querySnapshot.docs.first;
      if (!doc.data().containsKey('text')) {
        if (mounted) {
          setState(() {
            _response = 'User document does not contain the "text" field.';
            _loading = false;
          });
        }
        return;
      }

      final prompt = doc.get('text');

      // GROQ API call
      // Replace the API key with a secure method for production.
      const apiKey = 'YOUR_API_KEY_HERE';
      final uri = Uri.parse('https://api.groq.com/openai/v1/chat/completions');
      final groqResponse = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "mixtral-8x7b-32768",
          "messages": [
            {"role": "user", "content": prompt}
          ],
          "temperature": 0.7,
        }),
      );

      if (groqResponse.statusCode == 200) {
        final data = jsonDecode(groqResponse.body);
        // Check if the response has the expected format.
        if (data != null &&
            data['choices'] != null &&
            data['choices'].isNotEmpty &&
            data['choices'][0]['message'] != null) {
          final content = data['choices'][0]['message']['content'];
          if (mounted) {
            setState(() {
              _response = content;
              _loading = false;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              _response = 'Unexpected response format from GROQ.';
              _loading = false;
            });
          }
        }
      } else {
        if (mounted) {
          setState(() {
            _response = 'Error from GROQ: ${groqResponse.statusCode}';
            _loading = false;
          });
        }
      }
    } catch (e, stackTrace) {
      if (mounted) {
        setState(() {
          _response = 'An error occurred: $e';
          _loading = false;
        });
      }
      // Log error for debugging purposes.
      debugPrint('Error in _fetchPromptAndSendToGroq: $e\n$stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(16.0),
      child: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Text(
                _response,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
    );
  }
}
