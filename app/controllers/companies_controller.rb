class CompaniesController < ApplicationController
before_action :authenticate_user!
before_action :current_company, only: %i[show update destroy]

  def index
   @companies = current_user.companies
 end

 def new
   @company= Company.new
 end

 def create
   @company = User.find(current_user.id).companies.build(company_params)
   binding.pry
   if @company.save
     redirect_to company_path(@company)
   else
     render :new, notice: "All fields must be filled out"
   end
 end

 def show
 end

 def edit

 end

 def update
  if @company.update(company_params)
    redirect_to @company
  else
    render :edit
  end
 end

 def destroy
    @company.delete
    redirect_to companies_path
  end

 private

 def company_params
   params.require(:company).permit(:name, :revenue, :customer, :user_id,
   leads_attributes: [:name, :contact, :phone_number, :email])
 end

 def current_company
   @company = Company.find_by(id: params[:id])
 end

end
