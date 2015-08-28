require "ringc/version"
require "ringc/executor"
require "ringc/executors"

module Ringc
  class << self
    def ring(command, options = {})
      Executor.new(:systemu, options).execute(command)
    end
  end
end
