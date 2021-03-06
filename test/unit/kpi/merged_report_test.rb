require File.expand_path(File.dirname(__FILE__) + '/../../test_helper')

describe "KPI::MergedReport" do
  
  before do
    class TestKpi < KPI::Report
      def initialize return_value = 1
        super()
        @return = return_value
      end

      def test_kpi
        result "title", @return, :description => "description"
      end

      def test_kpi_2
        result "title 2 ", @return*2, :unit => 'EUR'
      end
    end
    class AnotherReport < KPI::Report
    end
  end

  after do
    Object.send(:remove_const, :TestKpi)
    Object.send(:remove_const, :AnotherReport)
  end

  describe "when initializing" do
    it "should initialize with list of KPI::Report::Base objects and block" do
      KPI::MergedReport.new(TestKpi.new) {}
      KPI::MergedReport.new(TestKpi.new, TestKpi.new) {}
      KPI::MergedReport.new(TestKpi.new,TestKpi.new, TestKpi.new) {}
    end

    it "should require at least one element when initializing" do
      assert_raises(ArgumentError) do
        KPI::MergedReport.new() {}
      end
    end

    it "should require objects of the same type when initializing" do
      assert_raises(ArgumentError) do
        KPI::MergedReport.new(TestKpi.new, AnotherReport.new) {}
      end
    end

    it "should require block when initializing" do
      assert_raises(Exception) do
        KPI::MergedReport.new(TestKpi.new)
      end
    end
  end

  describe "when two reports given for average" do
    before do
      @report1 = TestKpi.new(2)
      @report2 = TestKpi.new(8)

      @average = KPI::MergedReport.new(@report1, @report2) do |*entries|
        average = entries.map(&:value).sum / entries.size
        KPI::Entry.new "Average $$", average, :description => "$$ (average)"
      end
    end

    it "should calculate value using block given in initializer when asking for KPI" do
      assert_equal 5, @average.test_kpi.value
    end

    it "should change $$ in title to indicator title" do
      assert_equal "Average title", @average.test_kpi.name
    end

    it "should change $$ in description to indicator descripiton" do
      assert_equal "description (average)", @average.test_kpi.description
    end
    
    it "should have unit" do
      assert_equal "EUR", @average.test_kpi_2.unit
    end
    
    it "should allow to override unit" do
      @merged = KPI::MergedReport.new(@report1, @report2) do |*entries|
        KPI::Entry.new "merged $$", 1, :unit => "$"
      end
      assert_equal '$', @merged.test_kpi.unit
      assert_equal '$', @merged.test_kpi_2.unit
    end

    it "should return nil description when no description" do
      assert_nil @average.test_kpi_2.description
    end

    describe "entries" do
      it "should return enumerator with entries" do
        assert_kind_of Enumerable, @average.entries
      end

      it "should pack average entries to enumerator" do
        assert @average.entries.all? { |e| e.instance_of?(KPI::Entry) }
      end

      it "should have each average entry for each indicator" do
        assert_equal TestKpi.defined_kpis.size, @average.entries.to_a.size
      end

      it "should calculate averages for each indicator" do
        assert_equal [5,10], @average.entries.map(&:value)
      end
    end
    
    describe :defined_kpis do
      it "should return KPIs defined by all compounds" do
        assert_equal TestKpi.defined_kpis, @average.defined_kpis
      end

      it "should check if defined_kpis return array of symbol" do
        assert_same true, @average.defined_kpis.map(&:class).uniq === [Symbol]
      end

      it "should be true when check if kpi exists" do
        @raport = TestKpi.new(3)
        assert @raport.kpi_exists?("test_kpi")
      end

      it "should be false when check if kpi exists" do  
        @raport = TestKpi.new(3)
        assert !@raport.kpi_exists?("test_kpi_nie_ma")
      end

      it "should return test_kpi when calling test_kpi?" do
        assert true, @average.test_kpi?
      end
      
      it "should return false when calling non existing method with '?'" do
        assert !@average.test_kpi_23?
      end
    end
  end
end
