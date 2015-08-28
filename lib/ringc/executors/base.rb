require "ringc/result"

module Ringc
  module Executors
    class Base
      def initialize
        @result = Result.new
      end

      def run(command)
        @result.set_output(*measure { execute(command) })
        @result
      end

      def execute
        fail(NotImplementError)
      end

      private

      def finish
        @finish_times = Process.times
        @result.finish_time = Time.now
        set_times
      end

      def measure
        start
        result = yield
        finish
        result
      end

      def set_times
        @result.set_times(
          @finish_times.cutime - @start_times.cutime,
          @finish_times.cstime - @start_times.cstime
        )
      end

      def start
        @result.start_time = Time.now
        @start_times = Process.times
      end
    end
  end
end
