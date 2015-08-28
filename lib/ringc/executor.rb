require "memoist"

module Ringc
  class Executor
    extend Memoist

    attr_reader :type, :options

    def initialize(type, options)
      @type = type
      @options = options
    end

    def execute(command)
      executor.run(command)
    end

    private

    def executor
      executor_class.new
    end
    memoize :executor

    def executor_class
      case type
      when :systemu
        require "ringc/executors/systemu"
        Executors::Systemu
      else
        fail
      end
    end
  end
end
