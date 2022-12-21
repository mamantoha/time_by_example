require "time"

struct Time
  # Formats this `Time` according to the reference in *example*.
  #
  # See `TimeByExample::ExampleFormat` for details.
  #
  # ```
  # time = Time.local(2022, 1, 5, 17, 15, 30, location: Time::Location.load("Asia/Taipei"))
  # time.by_example("Jan 02 2006") # => "Jan 05 2022"
  # ```
  def by_example(example : String) : String
    TimeByExample::ExampleFormat.new(example).format(self)
  end
end
