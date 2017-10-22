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

    it "tests estimated property value from gross rent multiplier" do
      market_value = 2500000
      monthly_income = 50000

      estimated_value = RealEstateFinance::EstimatedPropertyValueFromGRM.new(
        market_value,
        monthly_income
      ).estimated_property_value_from_grm

      expect(estimated_value).to be(2500200.0)
    end


    it "tests gross operating income" do
      monthly_income = 5000
      estimated_loss_percentage = 10

      goi = RealEstateFinance::GrossOperatingIncome.new(
        monthly_income,
        estimated_loss_percentage
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

    it "tests estimated property value from capitalization rate" do
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

      estimated_value = RealEstateFinance::EstimatedPropertyValueFromCapRate.new(
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
      ).estimated_property_value_from_cap_rate

      expect(estimated_value).to eql(3978125.0)
    end

    it "tests cash flow before taxes" do
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
      interest_rate = 10
      loan_principle = 540000
      capital_expenditures = 20000
      capital_expenditure_loans = 3000
      earned_interest = 15000

      cash_flow_before_taxes_result = RealEstateFinance::CashFlowBeforeTaxes.new(
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
        interest_rate,
        loan_principle,
        capital_expenditures,
        capital_expenditure_loans,
        earned_interest
      ).cash_flow_before_taxes

      expect(cash_flow_before_taxes_result).to eql(-799400.0)
    end

    it "tests cash flow after taxes" do
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
      interest_rate = 10
      loan_principle = 540000
      capital_expenditures = 20000
      capital_expenditure_loans = 3000
      earned_interest = 15000
      state_income_tax = -45000
      federal_income_tax = 12000

      cfat = RealEstateFinance::CashFlowAfterTaxes.new(
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
        interest_rate,
        loan_principle,
        capital_expenditures,
        capital_expenditure_loans,
        earned_interest,
        state_income_tax,
        federal_income_tax
      ).cash_flow_after_taxes

      expect(cfat).to eq(-766400.0)
    end

    it "tests break even ratio" do
      interest_rate = 10
      loan_principle = 540000
      marketing = 200
      advertising = 100
      management = 20000
      legal = 2000
      accounting = 30000
      utilities = 100
      repairs = 200
      maintenance = 3000
      monthly_income = 5000
      estimated_loss_percentage = 10

      ber = RealEstateFinance::BreakEvenRatio.new(
        interest_rate,
        loan_principle,
        marketing,
        advertising,
        management,
        legal,
        accounting,
        utilities,
        repairs,
        maintenance,
        monthly_income,
        estimated_loss_percentage
      ).break_even_ratio

      expect(ber).to eq(99.27)
    end

    it "tests return on equity" do
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
      interest_rate = 10
      loan_principle = 540000
      capital_expenditures = 20000
      capital_expenditure_loans = 3000
      earned_interest = 15000
      state_income_tax = -45000
      federal_income_tax = 12000
      principle_invested = 3000000

      roq = RealEstateFinance::ReturnOnEquity.new(
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
        interest_rate,
        loan_principle,
        capital_expenditures,
        capital_expenditure_loans,
        earned_interest,
        state_income_tax,
        federal_income_tax,
        principle_invested
      ).return_on_equity

      expect(roq).to eq(2233600.0)
    end
  end
end
