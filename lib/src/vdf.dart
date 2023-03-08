import 'dart:io';

/// .vdf file parser
///
/// https://developer.valvesoftware.com/wiki/KeyValues
class VDF {
  /// Parses a .vdf String into a Map object
  static Map parses(String vdfString) {
    final vdfMap = {};
    final trimmed = vdfString.trim().replaceAll(RegExp(r"[\t\n]"), "");

    final stack = [vdfMap];

    int i = 0;
    int level = 0;
    while (i < trimmed.length) {
      if (trimmed[i] == "{") {
        level += 1;
        i++;
        continue;
      } else if (trimmed[i] == "}") {
        level -= 1;
        stack.removeLast();
        i++;
        continue;
      }

      final exp = RegExp('(?:(?<!/)(?:\\{2})*")(.*?)(?:(?<!/)(?:\\{2})*")');
      final matches = exp.allMatches(trimmed, i);
      if (matches.isNotEmpty) {
        final match = matches.first;
        if (matches.length > 1 && matches.elementAt(1).start == match.end) {
          stack[level][match[1]] = matches.elementAt(1)[1];
          i = matches.elementAt(1).end;
        } else {
          final newMap = {};
          stack[level][match[1]] = newMap;
          stack.add(newMap);
          i = match.end;
        }
      } else {
        break;
      }
    }

    return vdfMap;
  }

  /// Dump a Map to a .vdf string
  ///
  /// Every key should be a String, and values may either be a String or a Map
  static String dump(Map vdfMap) {
    return _dump(vdfMap, level: 0);
  }

  static String _dump(Map vdfMap, {level = 0}) {
    String vdfString = "";

    vdfMap.forEach((key, value) {
      if (value is Map) {
        final tabs = "\t" * level;
        vdfString += '$tabs"$key"\n$tabs{\n';
        vdfString += _dump(value, level: level + 1);
        vdfString += "$tabs}\n";
      } else {
        final tabs = "\t" * level;
        vdfString += '$tabs"$key"\t\t"$value"\n';
      }
    });

    return vdfString;
  }
}
