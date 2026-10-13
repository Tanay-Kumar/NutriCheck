import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic convertToJSON(String? prompt) {
  return json.decode('{"role": "user", "content": "$prompt"}');
}

String? newCustomFunction(dynamic responseDetails) {
  String extractUnhealthyScore(Map<String, dynamic> responseDetails) {
    try {
      // Ensure responseDetails is a Map and has the necessary structure
      if (responseDetails is Map<String, dynamic> &&
          responseDetails.containsKey('choices')) {
        var choices = responseDetails['choices'];
        if (choices is List && choices.isNotEmpty) {
          var message = choices[0]['message'];
          if (message is Map<String, dynamic> &&
              message.containsKey('content')) {
            var content = message['content'];
            if (content is String) {
              // Use regex to extract all occurrences of UNHEALTHY_SCORE
              RegExp regex = RegExp(r'(?i)\*\*UNHEALTHY_SCORE\*\*:\s*(\d+)%');
              Iterable<Match> matches = regex.allMatches(content);
              // Return the last matched score as a string
              if (matches.isNotEmpty) {
                return matches.last.group(1) ?? "0";
              }
            }
          }
        }
      }
      // Return "0" if the response structure doesn't match expected format
      return "0";
    } catch (error) {
      print("Error extracting UNHEALTHY_SCORE: $error");
      return "0";
    }
  }

  // Example usage with the given jsonResponse
  return extractUnhealthyScore(responseDetails);
}

String? newCustomFunction2(dynamic jsonResponse) {
  String extractImageDetails(Map<String, dynamic> jsonResponse) {
    try {
      // Extract the content
      String content = jsonResponse['choices'][0]['message']['content'];
      // Match the IMAGE_DETAILS using regex
      RegExp regex = RegExp(r'\*\*IMAGE_DETAILS\*\*:\s*(\d+)%');
      Match? match = regex.firstMatch(content);
      // Return the score as a string
      return match != null ? match.group(1)! : "0";
    } catch (error) {
      print("Error extracting IMAGE_DETAILS: $error");
      return "0";
    }
  }

  // Example usage with the given jsonResponse
  return extractImageDetails(jsonResponse);
}

String? formatScoringAPIdetails(String? apiresponse) {
  if (apiresponse == null) {
    return null;
  }

  // Function to remove unnecessary characters and special formatting
  String sanitizeString(String input) {
    return input.replaceAll(RegExp(r'[^a-zA-Z0-9\s,.\-%]'), '');
    // Retain only alphanumeric characters, spaces, and specific punctuation
  }

  // Function to escape double quotes and backslashes
  String sanitizeStringForJSON(String input) {
    input = input.replaceAll('"', '\\"'); // Escape double quotes
    input = input.replaceAll(r'\', r'\\'); // Escape backslashes
    return input;
  }

  // Sanitize the input content
  String sanitizedContent = sanitizeString(apiresponse);

  // Create the finalDetail string
  String finalDetail =
      'Based on the following nutrition facts and ingredient list, provide a health score out of 100% indicating how unhealthy this product is for human consumption - $sanitizedContent. Please provide an unhealthy score out of 100% only percentage, no other details.';

  // Sanitize the finalDetail string for JSON
  String sanitizedFinalDetail = sanitizeStringForJSON(finalDetail);

  try {
    // Try to encode finalDetail in a JSON object
    return sanitizedFinalDetail;
  } catch (e) {
    print("Invalid JSON: $e");
    return null;
  }

  // Return the cleaned and properly formatted string
}

dynamic newCustomFunction3(String? formatImage) {
  if (formatImage == null) {
    return null;
  }

  // Function to remove unnecessary characters and special formatting
  String sanitizeString(String input) {
    return input.replaceAll(RegExp(r'[^a-zA-Z0-9\s,.\-%]'), '');
    // Retain only alphanumeric characters, spaces, and specific punctuation
  }

  // Function to escape double quotes and backslashes
  String sanitizeStringForJSON(String input) {
    input = input.replaceAll('\n', ''); // Remove newline characters
    input = input.replaceAll('"', '\\"'); // Escape double quotes
    input = input.replaceAll(r'\', r'\\'); // Escape backslashes
    return input;
  }

  // Sanitize the input content
  String sanitizedContent = sanitizeString(formatImage);

  // Create the finalDetail string
  String finalDetail =
      'Based on the following nutrition facts and ingredient list, provide a health score out of 100% indicating how unhealthy this product is for human consumption - $sanitizedContent. Please provide an unhealthy score out of 100%, only percentage, no other details.';

  // Sanitize the finalDetail string for JSON
  String sanitizedFinalDetail = sanitizeStringForJSON(finalDetail);

  try {
    // Try to encode finalDetail in a JSON object
    Map<String, dynamic> requestBody = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": sanitizedFinalDetail}
      ],
      "max_tokens": 150
    };
    String jsonString = jsonEncode(requestBody);
    return jsonString;
  } catch (e) {
    print("Invalid JSON: $e");
    return null;
  }

  // Return the cleaned and properly formatted string
}

String? transformReadImageText(String? textResponse) {
  if (textResponse == null) {
    return null;
  }

  // Function to remove unnecessary characters and special formatting
  String sanitizeString(String input) {
    return input.replaceAll(RegExp(r'[^a-zA-Z0-9\s,.\-%]'), '');
    // Retain only alphanumeric characters, spaces, and specific punctuation
  }

  // Function to escape double quotes and backslashes
  String sanitizeStringForJSON(String input) {
    input = input.replaceAll('"', '\\"'); // Escape double quotes
    input = input.replaceAll(r'\', r'\\'); // Escape backslashes
    return input;
  }

  // Sanitize the input content
  String sanitizedContent = sanitizeString(textResponse);

  // Create the finalDetail string
  String finalDetail = '$sanitizedContent';

  // Sanitize the finalDetail string for JSON
  String sanitizedFinalDetail = sanitizeStringForJSON(finalDetail);

  try {
    // Try to encode finalDetail in a JSON object
    String jsonString = jsonEncode({"content": sanitizedFinalDetail});
    print("Valid JSON: $jsonString");
  } catch (e) {
    print("Invalid JSON: $e");
    return null;
  }

  // Return the cleaned and properly formatted string
  return finalDetail;
}

double? convertPercentTopoints(String? percentageData) {
  if (percentageData == null) return null;

  try {
    // Remove the '%' symbol and trim any extra spaces
    String cleanedString = percentageData.replaceAll('%', '').trim();

    // Parse the cleaned string to a double
    double value = double.parse(cleanedString);

    // Convert to a decimal by dividing by 100
    double decimalValue = value / 100;

    // Return the decimal value (between 0.0 and 1.0)
    return decimalValue;
  } catch (e) {
    // Handle potential parsing errors
    print('Error parsing percentage data: $e');
    return null;
  }
}

String? getColorCode(String? unhealthyPercentage) {
  if (unhealthyPercentage == null) return null;
  try {
    // Remove the '%' symbol and trim any extra spaces
    String cleanedString = unhealthyPercentage.replaceAll('%', '').trim();

    // Parse the cleaned string to a double
    double value = double.parse(cleanedString);

    // Return color code based on percentage
    if (value > 75) {
      return "#FF7981"; // Red for > 75%
    } else if (value >= 50 && value <= 75) {
      return "#C0EC7B"; // Yellow for 50% to 75%
    } else {
      return "#FF7981"; // Green for < 50%
    }
  } catch (e) {
    // Handle potential parsing errors
    print('Error parsing percentage data: $e');
    return null;
  }
}

String? convertIngradientDetails(String data) {
  List<String> parts = data.split('Ingredients');
  String nutritionFacts = parts[0];
  String ingredients = parts.length > 1 ? parts[1] : '';

  // Extract and format nutrition facts with percentages only
  List<String> factsLines = [];
  RegExp regExp = RegExp(r'- ([^%]+) (\d+%)'); // Capture percentages only
  Iterable<RegExpMatch> matches = regExp.allMatches(nutritionFacts);
  for (RegExpMatch match in matches) {
    String name = match.group(1)?.trim() ?? '';
    String percentage = match.group(2)?.trim() ?? '';

    // Remove ** or :: if present in the name
    name = name.replaceAll('**', '').replaceAll('::', '').trim();

    factsLines.add('$name: $percentage');
  }

  // Extract and format ingredients
  List<String> ingredientList = ingredients.split(',');
  for (int i = 0; i < ingredientList.length; i++) {
    String ingredient = ingredientList[i].trim();
    // Remove ** or :: if present in the ingredient
    ingredient = ingredient
        .replaceAll('**', '')
        .replaceAll('::', '')
        .replaceAll(':', '')
        .trim();
    ingredientList[i] = ingredient;
  }

  // Combine and return formatted result without "Ingredients" header
  return factsLines.join('\n') + '\n\n' + ingredientList.join('\n');
}

String? getIngredients(String? textRead) {
  // this fucntion takes in a string called text_read and returns a list of strings. The function goes through the parameter until it finds the word **ingredient**. Then the function takes the rest of the words and return them
  if (textRead == null) return null;

  textRead = textRead.toLowerCase();

  final List<String> words = textRead.split(' ');
  final int index = words.indexOf('ingredient');

  if (index == -1) return null;

  return words.sublist(index + 1).join(' ');
}

List<String>? transfrmIngradiendist(String? textResponse) {
  if (textResponse == null) {
    return null;
  }

  // Function to remove unnecessary characters and special formatting
  String sanitizeString(String input) {
    return input.replaceAll(RegExp(r'[^a-zA-Z0-9\s,.\-%]'), '');
    // Retain only alphanumeric characters, spaces, and specific punctuation
  }

  // Function to escape double quotes and backslashes
  String sanitizeStringForJSON(String input) {
    input = input.replaceAll('"', '\\"'); // Escape double quotes
    input = input.replaceAll(r'\', r'\\'); // Escape backslashes
    return input;
  }

  // Sanitize the input content
  String sanitizedContent = sanitizeString(textResponse);

  // Create the finalDetail string
  String finalDetail = '$sanitizedContent';

  if (finalDetail == null || finalDetail.isEmpty) {
    return [];
  }

  // Split the data by hyphen and remove the first empty element (before the first hyphen)
  List<String> parts = finalDetail.split('-').sublist(1);

  // Trim each part and store it in a new list
  List<String> ingredients = parts.map((part) => part.trim()).toList();

  // Return the list of ingredients
  return ingredients;
}

double? retrivePercentage(String? ingrad) {
  if (ingrad == null) return null;
  final regex = RegExp(r'(\d+%)');
  final match = regex.firstMatch(ingrad);
  if (match == null || match.group(0) == null) return null;

  try {
    // Remove the '%' symbol and trim any extra spaces
    String cleanedString = match.group(0)!.replaceAll('%', '').trim();

    // Parse the cleaned string to a double
    double value = double.parse(cleanedString);

    // Convert to a decimal by dividing by 100
    double decimalValue = value / 100;

    // Return the decimal value (between 0.0 and 1.0)
    return decimalValue;
  } catch (e) {
    // In case of parsing errors, return null
    return 0;
  }
}

String? getPercentageFrmString(String? ingrad) {
  if (ingrad == null) return null;
  if (!ingrad.contains('%') && ingrad.length > 1) return "0%";
  final regex = RegExp(r'(\d+%)');
  final match = regex.firstMatch(ingrad);
  if (match == null || match.group(0) == null) return null;
  return match.group(0);
}

String? getIngradName(String? input) {
  if (input == null) return null;
  if (!input.contains("%")) return input;
  final regex = RegExp(r'\d+%');
  final result = input.replaceAll(regex, '');
  return result;
}

bool? checkPreference(
  String? ingradList,
  List<String>? preservaticeList,
) {
  if (ingradList == null || preservaticeList == null) return null;
  final regex = RegExp(r'\d+%');
  // Convert the string to a list of ingredients
  final ingredients = ingradList.replaceAll(regex, '').split(',');

  // Check if any ingredient is in the preservative list
  for (var ingredient in ingredients) {
    if (preservaticeList.contains(ingredient.trim())) {
      return true;
    }
  }

  return false;
}

bool? deletepreference(
  String? preferenceName,
  String? userEmail,
) {
  if (preferenceName == null || userEmail == null) {
    return false;
  }

  /// Reference to the collection where preferences are stored
  // final collectionRef = FirebaseFirestore.instance.collection('preferences');

  // /// Query to find the document with the matching email and preference name
  // collectionRef
  //     .where('email', isEqualTo: userEmail)
  //     .where('preferenceName', isEqualTo: preferenceName)
  //     .get()
  //     .then((querySnapshot) {
  //   for (var doc in querySnapshot.docs) {
  //     /// Delete each document found
  //     doc.reference.delete();
  //   }
  // }).catchError((error) {
  //   /// Handle any errors here
  //   print("Error deleting document: $error");
  //   return false;
  // });

  return true;
}
