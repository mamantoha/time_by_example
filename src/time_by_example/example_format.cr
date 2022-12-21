module TimeByExample
  # Specifies the reference to convert a `Time` to and from a `String`.
  #
  # The reference time is `Jan 2, 2006 at 3:04:05 PM MST`, which can be remembered as `1 2 3 4 5 6 -7`.
  #
  # ```
  # time = Time.local(2022, 1, 5, 17, 15, 30, location: Time::Location.load("Asia/Taipei"))
  # TimeByExample::ExampleFormat.new("03:04 pm").format(time) # => "05:15 pm"
  # ```
  struct ExampleFormat
    # Returns the string reference of this format.
    getter reference : String

    @format_string : String? = nil

    def initialize(@reference : String)
    end

    FORMATS = {
      ".000000000" => ".9N",
      "-07:00:00"  => "%::z",
      ".000000"    => ".%6N",
      "January"    => "%B",
      "JANUARY"    => "%^B",
      "Monday"     => "%A",
      "MONDAY"     => "%^A",
      "-07:00"     => "%:z",
      "-7000"      => "%z",
      "2006"       => "%Y",
      ".000"       => ".%L",
      "002"        => "%j",
      "Jan"        => "%b",
      "JAN"        => "%^b",
      "Mon"        => "%a",
      "MON"        => "%^a",
      "MST"        => "%Z",
      "15"         => "%H",
      "06"         => "%y",
      "01"         => "%m",
      "02"         => "%d",
      "03"         => "%I",
      "PM"         => "%P",
      "pm"         => "%p",
      "AM"         => "%P",
      "am"         => "%p",
      "04"         => "%M",
      "05"         => "%S",
      "1"          => "%-m",
      "_1"         => "%_m",
      "2"          => "%-d",
      "_2"         => "%e",
      "3"          => "%l",
    }

    FORMAT_MATCHER = Regex.union(FORMATS.keys)

    private def format_string
      @format_string ||= reference.gsub(FORMAT_MATCHER, FORMATS)
    end

    # Turns a `Time` into a `String`.
    def format(time : Time) : String
      time.to_s(format_string)
    end
  end
end
