class LoansController < ApplicationController

  before_action :set_loan, only: [:new]

  def new
  end

  def create
    @loan = Loan.new
    @loan.roi = set_roi
    @loan.capital = loan_params[:capital]
    @loan.save
    redirect_to new_borrower_path
  end

  private

  def loan_params
    params.require(:loan).permit(:capital, :roi)
  end

  def set_loan
    @loan = Loan.new
  end

  def set_roi
    if loan_params[:roi] == "Sécurité"
      0.03
    elsif loan_params[:roi] == "Tranquilité"
      0.06
    elsif loan_params[:roi] == "Dynamique"
      0.09
    end
  end

end
