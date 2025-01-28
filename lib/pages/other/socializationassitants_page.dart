import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/other/petselected_widget.dart';
import 'package:pet_tracker/widgets/other/chatbottomsheet_widget.dart';

class SocializationAssistantsPage extends StatefulWidget {
  const SocializationAssistantsPage({super.key});

  @override
  State<SocializationAssistantsPage> createState() =>
      _SocializationAssistantsPageState();
}

class _SocializationAssistantsPageState
    extends State<SocializationAssistantsPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _chatMessages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage(String message) async {
    setState(() {
      _chatMessages.add({
        "role": "user",
        "content": message,
      });
      _messageController.clear();
      _isLoading = true;
    });

    _scrollToBottom();

    try {
      final response = await http.post(
        Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${SharedConstants.geminiApiKey}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  "text": message,
                }
              ],
              "role": "user"
            }
          ],
          "safetySettings": [
            {"category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_NONE"}
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['candidates'] != null && data['candidates'].isNotEmpty) {
          final botResponse =
              data['candidates'][0]['content']['parts'][0]['text'] as String;

          if (mounted) {
            setState(() {
              _chatMessages.add({
                "role": "assistant",
                "content": botResponse,
              });
              _isLoading = false;
            });
            _scrollToBottom();
          }
        } else {
          throw Exception('Empty response from API');
        }
      } else {
        throw Exception('Failed to get response: ${response.statusCode}');
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _chatMessages.add({
            "role": "assistant",
            "content":
                "Sorry, I couldn't process your request. Please try again.",
          });
          _isLoading = false;
        });
        _scrollToBottom();
      }
      debugPrint('Error: $e');
    }
  }

  void _showChatBottomSheet({required double height, required double width}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChatBottomSheet(
        messages: _chatMessages,
        isLoading: _isLoading,
        onSend: _sendMessage,
        title: context.tr("socializationAssistantChat"),
        hintText: context.tr("askAnythingAboutSocialization"),
      ),
    );
  }

  // Info Card Widget
  Widget _buildInfoCard({
    required String title,
    required Widget content,
    required double height,
    required double width,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width * SharedConstants.paddingGenerall,
        vertical: height * SharedConstants.paddingGenerall,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingGenerall,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * SharedConstants.paddingSmall,
            ),
            child: content,
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(String tip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle,
              color: SharedConstants.orangeColor, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(tip)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr("socializationAssistant")),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: SharedConstants.orangeColor,
        child: const Icon(Icons.chat),
        onPressed: () => _showChatBottomSheet(height: height, width: width),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: width * SharedConstants.paddingGenerall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pet Selected
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingSmall,
              ),
              child: const PetSelectedDropdownButtonWidget(),
            ),
            // Socialization Progress Card
            _buildInfoCard(
              height: height,
              width: width,
              title: context.tr("socializationProgress"),
              content: Column(
                children: [
                  _buildProgressBar("Dog Interaction", 0.8),
                  _buildProgressBar("People Interaction", 0.6),
                  _buildProgressBar("Environment Adaptation", 0.7),
                ],
              ),
            ),
            // Upcoming Events Card
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingSmall,
              ),
              child: _buildInfoCard(
                height: height,
                width: width,
                title: context.tr("upcomingEvents"),
                content: Column(
                  children: [
                    _buildEventItem(
                      "Dog Park Meetup",
                      "Saturday, 2:00 PM",
                      "Central Park",
                    ),
                    _buildEventItem(
                      "Puppy Training Class",
                      "Sunday, 10:00 AM",
                      "Pet Training Center",
                    ),
                  ],
                ),
              ),
            ),
            // Socialization Tips
            _buildInfoCard(
              height: height,
              width: width,
              title: context.tr("socializationTips"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTipItem("Start socialization early in your pet's life"),
                  _buildTipItem("Expose to different environments gradually"),
                  _buildTipItem("Use positive reinforcement"),
                  _buildTipItem("Monitor body language for stress signs"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(String label, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            valueColor:
                AlwaysStoppedAnimation<Color>(SharedConstants.orangeColor),
          ),
          Text('${(progress * 100).toInt()}%'),
        ],
      ),
    );
  }

  Widget _buildEventItem(String title, String time, String location) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                time,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
