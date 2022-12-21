# TimeByExample

[![Crystal CI](https://github.com/mamantoha/time_by_example/actions/workflows/crystal.yml/badge.svg)](https://github.com/mamantoha/time_by_example/actions/workflows/crystal.yml)
[![GitHub release](https://img.shields.io/github/release/mamantoha/time_by_example.svg)](https://github.com/mamantoha/time_by_example/releases)
[![License](https://img.shields.io/github/license/mamantoha/time_by_example.svg)](https://github.com/mamantoha/time_by_example/blob/master/LICENSE)

Provides a Crystal implementation of Go-style time [formatting](https://pkg.go.dev/time#Time.Format) by example.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     time_by_example:
       github: mamantoha/time_by_example
   ```

2. Run `shards install`

## Usage

```crystal
require "time_by_example"
```

This shard adds a `by_example` method to `Time`.

The argument to this method is the formatted version of a reference date.

For example:

```crystal
time = Time.local(2022, 12, 20, 17, 15, 30, location: Time::Location.load("Asia/Taipei"))

time.by_example("Jan 02 2006 @ 03:04 pm") => "Dec 20 2022 @ 05:15 pm"
time.by_example("Jan 02 2006 @ 15:04")    => "Dec 20 2022 @ 17:15"
time.by_example("Mon 02 Jan 15:04")       => "Tue 20 Dec 17:15"
time.by_example("01/02/06")               => "12/20/22"
time.by_example("02.01.2006")             => "20.12.2022"
time.by_example("15:04 MST")              => "17:15 Asia/Taipei"
```

The reference time is `Jan 2, 2006 at 3:04:05 PM MST`, which can be remembered as `1 2 3 4 5 6 -7`.

### Supported formats

| Period              | Constants                                                                       |
| ------------------- | ------------------------------------------------------------------------------- |
| **Year**            | `2006` and `06`                                                                 |
| **Month**           | `January`, `JANUARY`, `Jan`, `JAN`, `1`, `01`, and `_1` for space padding       |
| **Day of the week** | `Mon`, `MON`, `Monday`, `MONDAY`                                                |
| **Day of month**    | `2`, `02`, and `_2` for space padding                                           |
| **Day of year**     | `002`                                                                           |
| **Hour**            | `15`, `3`, `03`, `pm`, `PM`, `am`, `AM`                                         |
| **Minute**          | `04`, but not `4`                                                               |
| **Second**          | `05`, `05.000` for milliseconds and `05.000000` and `05.000000000`, but not `5` |
| **Time Zone**       | `-7000`, `-07:00`, `-07:00:00`, `MST`                                           |

### Alternate usage

If you want to reuse a format multiple times, you can do so by creating and reusing an `TimeByExample::ExampleFormat`

```crystal
ef = TimeByExample::ExampleFormat.new("03:04 pm")

ef.format(Time.local(2022, 12, 20, 17, 15, 30)) # => "05:15 pm"
ef.format(Time.local(2022, 12, 20, 5, 15, 30))  # => "05:15 am"
```

## Contributing

1. Fork it (<https://github.com/mamantoha/time_by_example/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
