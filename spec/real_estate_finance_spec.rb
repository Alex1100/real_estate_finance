require "spec_helper"

describe RealEstateFinance do
  context "tests methods" do
    it "has a version number" do
      expect(RealEstateFinance::VERSION).not_to be nil
    end

    it "tests gross potential income" do
      gpi = RealEstateFinance::GrossPotentialIncome.new(34000).gross_potential_income
      expect(gpi).to eql(408000.0)
    end

    it "tests net operating income" do
      noi = RealEstateFinance::NetOperatingIncome.new(34000, 850, 850, 100, 2000, 200, 100, 20000, 2000, 30000, 100, 200, 3000, 100000, 500000).net_operating_income
      expect(noi).to eql(-251400.0)
    end

    it "tests gross rental multiplier" do
      grm = RealEstateFinance::GrossRentalMultiplier.new(2500000, 50000).gross_rental_multiplier
      expect(grm).to eql(4.167)
    end

    it "tests estimated property value by gross rent multiplier" do
      market_value = 2500000
      monthly_income = 50000
      estimated_value = RealEstateFinance::EstimatedPropertyValueByGRM.new(market_value, monthly_income).estimated_property_value
      expect(estimated_value).to be(2500200.0)
    end
  end
end
