class CompanyController < ApplicationController
  def new
    @kind = Company.new
  end

  def show
    @company = current_company_by_user
  end

  def create
    @company = Company.new(infoco_params)
    if @company.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @company = current_company_by_user
  end

  def update
    @company = current_company_by_user
    if @company.update(infoco_params)
      flash[:success] = "Profile updated"
      redirect_to @company
    else
      render 'edit'
    end
  end

  def index
    @kind = Company.new
    #aqui se pondra los repute
  end

private
  def current_company_by_user
    current_user.company
  end

  def infoco_params #parámetros fuertes para evitar la vulnerabilidad de asignación de masas 
      params.require(:company).permit(:name_co, :ceo_co, :page, 
                                      :type_co, :latitud, :longitud, :description, :user_id)
  end
end
