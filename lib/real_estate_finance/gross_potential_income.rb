module RealEstateFinance
  class GrossPotentialIncome

    attr_reader :monthly_income

    def initialize(monthly_income)
      @monthly_income = monthly_income
    end

    def gross_potential_income
      sprintf("%0.02f", (@monthly_income * 12)).to_f
    end

  end
end
