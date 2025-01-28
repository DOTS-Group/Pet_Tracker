import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/other/petselected_widget.dart';
import 'package:pet_tracker/widgets/other/chatbottomsheet_widget.dart';

class WalkingAssistantsPage extends StatefulWidget {
  const WalkingAssistantsPage({super.key});

  @override
  State<WalkingAssistantsPage> createState() => _WalkingAssistantsPageState();
}

class _WalkingAssistantsPageState extends State<WalkingAssistantsPage> {
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Walking Assistant"),
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
            // Walking Stats Card
            _buildInfoCard(
              height: height,
              width: width,
              title: context.tr("walkingStats"),
              content: Column(
                children: [
                  _buildStatRow(Icons.directions_walk, context.tr("steps"),
                      "5,234", width),
                  _buildStatRow(
                      Icons.timer, context.tr("duration"), "45 mins", width),
                  _buildStatRow(
                      Icons.speed, context.tr("distance"), "2.5 km", width),
                ],
              ),
            ),
            // Walking Tips Card
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingSmall,
              ),
              child: _buildInfoCard(
                height: height,
                width: width,
                title: context.tr("walkingTips"),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTipItem("Start with 15-20 minute walks"),
                    _buildTipItem("Keep a consistent pace"),
                    _buildTipItem("Bring water for your pet"),
                    _buildTipItem("Avoid walking in extreme weather"),
                  ],
                ),
              ),
            ),
            // Recommended Routes Card
            _buildInfoCard(
              height: height,
              width: width,
              title: context.tr("recommendedRoutes"),
              content: Column(
                children: [
                  _buildRouteItem(
                      context.tr("parkRoute"), "15 min walk", "Easy"),
                  _buildRouteItem(
                      context.tr("lakeRoute"), "30 min walk", "Moderate"),
                  _buildRouteItem(
                      context.tr("hillPath"), "45 min walk", "Challenging"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Info Card
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
            color: Colors.black.withValues(alpha: 0.05),
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

  // Stat Row
  Widget _buildStatRow(
      IconData icon, String label, String value, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: SharedConstants.orangeColor),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * SharedConstants.paddingSmall,
            ),
            child: Text(label),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Tip Item
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

  // Route Item
  Widget _buildRouteItem(String name, String duration, String difficulty) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.map, color: SharedConstants.orangeColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('$duration • $difficulty',
                  style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
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
        title: context.tr("walkingAssistantChat"),
        hintText: context.tr("askAnythingAboutWalking"),
      ),
    );
  }
}
