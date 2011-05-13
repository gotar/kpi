module KPI
  module Report
    class Comparator
      extend KPI::Report::SuppressMemoization
      extend ActiveSupport::Memoizable

      include KPI::Report::DynamicDefinitions
      
      blacklist :initialize, :collect!, :entries, :time, :title

      def initialize()
      end

      def title
        self.class.name
      end
    end
  end
end