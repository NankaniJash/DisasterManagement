// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

class GroqDataWidget extends StatefulWidget {
  const GroqDataWidget({
    Key? key,
    this.width,
    this.height,
    this.label,
    this.color, // Card background color
    this.prompt,
    this.dataset,
    // Customizable texts
    this.headingText,
    this.promptTitle,
    this.responseTitle,
    // Customizable text colors
    this.headingTextColor,
    this.promptTitleColor,
    this.promptTextColor, // For the prompt content
    this.responseTitleColor,
    this.responseTextColor,
    // Customizable text sizes
    this.headingTextSize,
    this.promptTitleSize,
    this.responseTitleSize,
    this.responseTextSize,
    // Customizable font families for texts
    this.headingFontFamily,
    this.promptTitleFontFamily,
    this.promptFontFamily,
    this.responseTitleFontFamily,
    this.responseFontFamily,
    // Card properties
    this.cardElevation,
    this.cardBorderRadius,
    // Card border customization
    this.cardBorderColor,
    this.cardBorderWidth,
    // Customizable inner container (response box) properties
    this.innerContainerBackgroundColor,
    this.innerContainerBorderRadius,
    // Inner container border customization
    this.innerContainerBorderColor,
    this.innerContainerBorderWidth,
    // Customizable gradient for response container border
    this.gradientStartColor,
    this.gradientEndColor,
    // Customizable max height for scrollable response area
    this.responseMaxHeight,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? label;
  final Color? color;
  final String? prompt;
  final dynamic dataset;

  // Text strings
  final String? headingText;
  final String? promptTitle;
  final String? responseTitle;

  // Text colors
  final Color? headingTextColor;
  final Color? promptTitleColor;
  final Color? promptTextColor;
  final Color? responseTitleColor;
  final Color? responseTextColor;

  // Text sizes
  final double? headingTextSize;
  final double? promptTitleSize;
  final double? responseTitleSize;
  final double? responseTextSize;

  // Font families for texts
  final String? headingFontFamily;
  final String? promptTitleFontFamily;
  final String? promptFontFamily;
  final String? responseTitleFontFamily;
  final String? responseFontFamily;

  // Card properties
  final double? cardElevation;
  final double? cardBorderRadius;
  // Card border customization
  final Color? cardBorderColor;
  final double? cardBorderWidth;

  // Inner container (response box) properties
  final Color? innerContainerBackgroundColor;
  final double? innerContainerBorderRadius;
  // Inner container border customization
  final Color? innerContainerBorderColor;
  final double? innerContainerBorderWidth;

  // Gradient colors for response container border
  final Color? gradientStartColor;
  final Color? gradientEndColor;

  // Max height for scrollable response area
  final double? responseMaxHeight;

  @override
  State<GroqDataWidget> createState() => _GroqDataWidgetState();
}

class _GroqDataWidgetState extends State<GroqDataWidget> {
  String aiResponse = "Awaiting response...";

  @override
  void initState() {
    super.initState();
    sendToGroq();
  }

  Future<void> sendToGroq() async {
    // Build the request payload. If a dataset JSON is provided, convert it to a string.
    final Map<String, dynamic> payload = {
      "model": "llama3-70b-8192",
      if (widget.dataset != null)
        "metadata": {
          "dataset": jsonEncode(widget.dataset),
        },
      "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": widget.prompt ?? ''},
      ]
    };

    final response = await http.post(
      Uri.parse('https://api.groq.com/openai/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final content = jsonResponse['choices'][0]['message']['content'];
      setState(() {
        aiResponse = content;
      });
    } else {
      setState(() {
        aiResponse = 'Error ${response.statusCode}: ${response.body}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Base settings for container dimensions & styling
    final Color cardBgColor = widget.color ?? Colors.grey.shade200;
    final double cardElev = widget.cardElevation ?? 6.0;
    final double cardRadius = widget.cardBorderRadius ?? 16.0;
    final double innerRadius = widget.innerContainerBorderRadius ?? 10.0;
    final double maxResponseHeight = widget.responseMaxHeight ?? 200.0;

    // Text defaults
    final String headerText = widget.headingText ?? "🧠 Groq AI Response";
    final Color headerTextColor = widget.headingTextColor ?? Colors.deepPurple;
    final double headerTextSize = widget.headingTextSize ?? 22.0;

    final String pTitle = widget.promptTitle ?? "Your Prompt:";
    final Color pTitleColor = widget.promptTitleColor ?? Colors.black87;
    final double pTitleSize = widget.promptTitleSize ?? 16.0;

    final String rTitle = widget.responseTitle ?? "AI Response:";
    final Color rTitleColor = widget.responseTitleColor ?? Colors.black87;
    final double rTitleSize = widget.responseTitleSize ?? 16.0;

    final Color gradStart =
        widget.gradientStartColor ?? FlutterFlowTheme.of(context).primaryColor;
    final Color gradEnd =
        widget.gradientEndColor ?? FlutterFlowTheme.of(context).secondaryColor;

    final Color innerBgColor =
        widget.innerContainerBackgroundColor ?? Colors.grey.shade100;
    final Color respTextColor = widget.responseTextColor ?? Colors.black87;
    final double respTextSize = widget.responseTextSize ?? 15.0;

    final Color actualPromptTextColor =
        widget.promptTextColor ?? Colors.black87;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: cardElev,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius),
          side: BorderSide(
            color: widget.cardBorderColor ?? Colors.transparent,
            width: widget.cardBorderWidth ?? 0,
          ),
        ),
        color: cardBgColor,
        shadowColor: Colors.grey.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading Text
              Text(
                headerText,
                style: TextStyle(
                  fontSize: headerTextSize,
                  fontWeight: FontWeight.bold,
                  color: headerTextColor,
                  fontFamily: widget.headingFontFamily,
                ),
              ),
              const SizedBox(height: 16),

              // Prompt Section
              Text(
                pTitle,
                style: TextStyle(
                  fontSize: pTitleSize,
                  fontWeight: FontWeight.w600,
                  color: pTitleColor,
                  fontFamily: widget.promptTitleFontFamily,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.prompt ?? '',
                style: TextStyle(
                  fontSize: 15,
                  color: actualPromptTextColor,
                  fontFamily: widget.promptFontFamily,
                ),
              ),
              const Divider(height: 32, thickness: 1.2),

              // AI Response Section
              Text(
                rTitle,
                style: TextStyle(
                  fontSize: rTitleSize,
                  fontWeight: FontWeight.w600,
                  color: rTitleColor,
                  fontFamily: widget.responseTitleFontFamily,
                ),
              ),
              const SizedBox(height: 8),
              // Gradient container for the response box
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [gradStart, gradEnd],
                  ),
                ),
                padding: const EdgeInsets.all(2),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: innerBgColor,
                    borderRadius: BorderRadius.circular(innerRadius),
                    border: (widget.innerContainerBorderColor != null &&
                            (widget.innerContainerBorderWidth ?? 0) > 0)
                        ? Border.all(
                            color: widget.innerContainerBorderColor!,
                            width: widget.innerContainerBorderWidth!,
                          )
                        : null,
                  ),
                  // Scrollable AI Response
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: maxResponseHeight),
                    child: SingleChildScrollView(
                      child: Text(
                        aiResponse,
                        style: TextStyle(
                          fontSize: respTextSize,
                          color: respTextColor,
                          fontFamily: widget.responseFontFamily,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
