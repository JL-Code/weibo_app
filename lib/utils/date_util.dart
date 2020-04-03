class DateUtil {
  /// 月份
  final Map<String, int> MONTHS_EN = {
    "Jan": 1,
    "Feb": 2,
    "Mar": 3,
    "Apr": 4,
    "May": 5,
    "Jun": 6,
    "Jul": 7,
    "Aug": 8,
    "Sep": 9,
    "Oct": 10,
    "Nov": 11,
    "Dec": 12,
  };

  /// 星期
  final Map<String, int> WEEKS_EN = {
    "Mon": 1,
    "Tues": 2,
    "Wed": 3,
    "Thur": 4,
    "Fri": 5,
    "Sat": 6,
    "Sun": 7,
  };

  int _year; // 年份
  int _month; // 月
  int _day; // 日
  int _hour; // 时
  int _minute; // 分
  int _second; // 秒
  int _timezone; // 时区
  int _week; // 星期
  String _time; //时间
  final blankSeparator = " ";
  final timeSeparator = ":";
  DateTime _dateTime;

  DateTime get dateTime => _dateTime;

  /**
   * 解析日期字符串
   * 接受字符串的示例：
   * Sun  Mar 13 21:35:10 +0800 2011
   * 星期 月份 日  时分秒    时区   年份
   */
  DateUtil parse(String input) {
    var lumps = input.split(blankSeparator);
    if (lumps.length == 6) {
      _year = int.parse(lumps[lumps.length - 1]);
      _week = WEEKS_EN[lumps[0]];
      _month = MONTHS_EN[lumps[1]];
      _day = int.parse(lumps[2]);
      _time = lumps[3];
      _timezone = int.parse(lumps[4]);
      var timeLumps = _time.split(timeSeparator);
      _hour = int.parse(timeLumps[0]);
      _minute = int.parse(timeLumps[1]);
      _second = int.parse(timeLumps[2]);
      /**
       *
        int year,
        [int month = 1,
        int day = 1,
        int hour = 0,
        int minute = 0,
        int second = 0,
        int millisecond = 0,
        int microsecond = 0]
      */
      _dateTime = DateTime(_year, _month, _day, _hour, _minute, _second);
    } else {
      _dateTime = DateTime.parse("1969-07-20 20:18:04Z");
    }
    return this;
  }

  /// 格式化日期
  /// [pattern] 格式模式
  /// “YYYY format” 是 “ISO week numbering system” ISO周编号系统
  /// “yyyy format” 是 “Gregorian Calendar” 阳历日历
  /// see: https://www.zhihu.com/question/20689960
  /// 支持的模式示例：
  /// yyyy-MM-dd HH:mm:ss
  String format(String pattern) {
    // var str = pattern
    //   ..replaceFirst(RegExp("yyyy"), _year.toString())
    //   ..replaceFirst("MM", _month.toString())
    //   ..replaceFirst("dd", _day.toString())
    //   ..replaceFirst("HH", _hour.toString())
    //   ..replaceFirst("mm", _minute.toString())
    //   ..replaceFirst("ss", _second.toString());
    // return str;
    var regs = {
      "yyyy": _year.toString().padLeft(4, '0'),
      "MM": _month.toString().padLeft(2, '0'),
      "dd": _day.toString().padLeft(2, '0'),
      "HH": _hour.toString().padLeft(2, '0'),
      "mm": _minute.toString().padLeft(2, '0'),
      "ss": _second.toString().padLeft(2, '0')
    };

    regs.forEach((key, value) {
      pattern = pattern.replaceFirst(key, value);
    });

    return pattern;
  }
}
