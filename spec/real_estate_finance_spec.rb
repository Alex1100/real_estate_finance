require "spec_helper"

describe RealEstateFinance do
  context "tests methods" do
    it "has a version number" do
      expect(RealEstateFinance::VERSION).not_to be nil
    end

    it "tests gross potential income" do
      monthly_income = 34000
      gpi = RealEstateFinance::GrossPotentialIncome.new(monthly_income).gross_potential_income
      expect(gpi).to eql(408000.0)
    end

    it "tests net operating income" do
      monthly_income = 34000
      vacancies = 850
      non_payments = 850
      taxes = 100
      mortgage_interest = 2000
      marketing = 200
      advertising = 100
      management = 20000
      legal = 2000
      accounting = 30000
      utilities = 100
      repairs = 200
      maintenance = 3000
      acquisition = 100000
      sale_costs = 500000

      noi = RealEstateFinance::NetOperatingIncome.new(
        monthly_income,
        vacancies,
        non_payments,
        taxes,
        mortgage_interest,
        marketing,
        advertising,
        management,
        legal,
        accounting,
        utilities,
        repairs,
        maintenance,
        acquisition,
        sale_costs
      ).net_operating_income

      expect(noi).to eql(-251400.0)
    end

    it "tests gross rental multiplier" do
      market_value = 2500000
      monthly_income = 50000

      grm = RealEstateFinance::GrossRentalMultiplier.new(
        market_value,
        monthly_income
      ).gross_rental_multiplier

      expect(grm).to eql(4.167)
    end

    it "tests estimated property value by gross rent multiplier" do
      market_value = 2500000
      monthly_income = 50000

      estimated_value = RealEstateFinance::EstimatedPropertyValueByGRM.new(
        market_value,
        monthly_income
      ).estimated_property_value

      expect(estimated_value).to be(2500200.0)
    end


    it "tests gross operating income" do
      monthly_income = 5000
      estimatedLossPercentage = 10

      goi = RealEstateFinance::GrossOperatingIncome.new(
        monthly_income,
        estimatedLossPercentage
      ).gross_operating_income

      expect(goi).to eql(6000.0)
    end

    it "tests capitalization rate" do
      monthly_income = 222000
      vacancies = 850
      non_payments = 850
      taxes = 100
      mortgage_interest = 2000
      marketing = 200
      advertising = 100
      management = 20000
      legal = 2000
      accounting = 30000
      utilities = 100
      repairs = 200
      maintenance = 3000
      acquisition = 2000000
      sale_costs = 350000
      sale_earned = 4000000

      cap_rate = RealEstateFinance::CapitalizationRate.new(
        monthly_income,
        vacancies,
        non_payments,
        taxes,
        mortgage_interest,
        marketing,
        advertising,
        management,
        legal,
        accounting,
        utilities,
        repairs,
        maintenance,
        acquisition,
        sale_costs,
        sale_earned
      ).capitalization_rate

      expect(cap_rate).to eql(0.064)
    end

    it "tests estimated property value by capitalization rate"
  end
end
