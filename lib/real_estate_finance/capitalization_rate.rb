module RealEstateFinance
  class CapitalizationRate

    attr_reader :monthly_income, :vacancies, :non_payments, :taxes, :mortgage_interest, :marketing, :advertising, :management, :legal, :accounting, :utilities, :repairs, :maintenance, :acquisition, :sale_costs, :sale_earned

    def initialize(monthly_income, vacancies, non_payments, taxes, mortgage_interest, marketing, advertising, management, legal, accounting, utilities, repairs, maintenance, acquisition, sale_costs, sale_earned)
      @monthly_income = monthly_income
      @vacancies = vacancies
      @non_payments = non_payments
      @taxes = taxes
      @mortgage_interest = mortgage_interest
      @marketing = marketing
      @advertising = advertising
      @management = management
      @legal = legal
      @accounting = accounting
      @utilities = utilities
      @repairs = repairs
      @maintenance = maintenance
      @acquisition = acquisition
      @sale_costs = sale_costs
      @sale_earned = sale_earned
    end

    def capitalization_rate
      gpi = sprintf("%0.02f", (@monthly_income * 12)).to_f
      credit_losses = [@vacancies, @non_payments, @taxes, @mortgage_interest, @marketing, @advertising, @management, @legal, @accounting, @utilities, @repairs, @maintenance, @acquisition, @sale_costs]
      total_expenses = credit_losses.reduce(:+)
      expenses = sprintf("%0.02f", total_expenses).to_f
      noi = gpi - expenses
      cap_rate = sprintf("%0.03f", (noi/(@sale_earned))).to_f
    end

  end
end
