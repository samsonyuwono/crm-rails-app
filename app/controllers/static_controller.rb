class StaticController < ApplicationController
  before_action :authenticate_user!, only: [:customers]

  def home
  end

  def customers
    @customers= current_user.customers
  end

  def dashboard
   @total_revenue = current_user.total_revenue
   @total_contacts= current_user.total_contacts
 end


end
