require "./spec_helper"

describe TimeByExample do
  time = Time.utc(2022, 1, 5, 17, 15, 30)
  # time = Time.local(2022, 1, 5, 17, 15, 30, location: Time::Location.load("Asia/Taipei"))

  describe "Time#by_example" do
    it { time.by_example("03:04").should eq("05:15") }
    it { time.by_example("3:04").should eq(" 5:15") }
    it { time.by_example("15:04").should eq("17:15") }
    it { time.by_example("03:04 PM").should eq("05:15 PM") }
    it { time.by_example("03:04 AM").should eq("05:15 PM") }
    it { time.by_example("3:04").should eq(" 5:15") }
    # it { time.by_example("15:04 MST").should eq("17:15 Asia/Taipeil") }
    it { time.by_example("15:04 MST").should eq("17:15 UTC") }
    # it { time.by_example("15:04 -07:00").should eq("17:15 +08:00") }
    it { time.by_example("15:04 -07:00").should eq("17:15 +00:00") }
    it { time.by_example("Jan 02 2006").should eq("Jan 05 2022") }
    it { time.by_example("Jan 2 2006").should eq("Jan 5 2022") }
    it { time.by_example("01-02-2006").should eq("01-05-2022") }
    it { time.by_example("_1-02-2006").should eq(" 1-05-2022") }
    it { time.by_example("1-2-06").should eq("1-5-22") }
    it { time.by_example("_2-01-06").should eq(" 5-01-22") }
    it { time.by_example("02.01.2006").should eq("05.01.2022") }
    it { time.by_example("2.01.2006").should eq("5.01.2022") }
    it { time.by_example("01/02/2006").should eq("01/05/2022") }
    it { time.by_example("1/2/2006").should eq("1/5/2022") }
    it { time.by_example("Mon").should eq("Wed") }
    it { time.by_example("Monday").should eq("Wednesday") }
    it { time.by_example("02-Jan-2006").should eq("05-Jan-2022") }
    it { time.by_example("2-Jan-2006").should eq("5-Jan-2022") }
    it { time.by_example("20060102").should eq("20220105") }
    it { time.by_example("Mon 02 Jan 15:04").should eq("Wed 05 Jan 17:15") }
    it { time.by_example("002").should eq("005") }
  end

  describe TimeByExample::ExampleFormat do
    it { TimeByExample::ExampleFormat.new("03:04 pm").format(time).should eq("05:15 pm") }
  end
end
