module RealEstateFinance
  class NetOperatingIncome

    attr_reader :monthly_income, :vacancies, :non_payments, :taxes, :mortgage_interest, :marketing, :advertising, :management, :legal, :accounting, :utilities, :repairs, :maintenance, :acquisition, :sale

    def initialize(monthly_income, vacancies, non_payments, taxes, mortgage_interest, marketing, advertising, management, legal, accounting, utilities, repairs, maintenance, acquisition, sale)
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
      @sale = sale
    end

    def net_operating_income
      gpi = sprintf("%0.02f", (@monthly_income * 12)).to_f
      credit_losses = [@vacancies, @non_payments, @taxes, @mortgage_interest, @marketing, @advertising, @management, @legal, @accounting, @utilities, @repairs, @maintenance, @acquisition, @sale]
      total_expenses = credit_losses.reduce(:+)
      expenses = sprintf("%0.02f", total_expenses).to_f
      noi = gpi - expenses
    end

  end
end
