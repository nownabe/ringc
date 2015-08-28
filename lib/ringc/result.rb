require "memoist"

module Ringc
  class Result
    extend Memoist

    attr_accessor :start_time, :finish_time
    attr_reader :status, :stdout, :stderr
    attr_reader :user_time, :system_time

    def initialize
    end

    def real_time
      finish_time - start_time
    end
    memoize :real_time
    alias_method :real, :real_time

    def set_output(status, stdout, stderr)
      @status = status
      @stdout = stdout
      @stderr = stderr
    end

    def set_times(utime, stime)
      @user_time   = utime
      @system_time = stime
    end
    alias_method :utime, :user_time
    alias_method :stime, :system_time

    def success?
      status == 0
    end

    def total_time
      utime + stime
    end
    memoize :total_time
    alias_method :total, :total_time
  end
end
