require "./time_by_example/time"
require "./time_by_example/example_format"

module TimeByExample
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end
