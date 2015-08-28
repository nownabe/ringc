require "systemu"
require "ringc/executors/base"

module Ringc
  module Executors
    class Systemu < Base
      def execute(command)
        systemu(command)
      end
    end
  end
end
