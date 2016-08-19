class RelationController < ApplicationController
  def new
    @kind = Relation.new
  end

  def create
    @relation = Relation.new(rela_params)
    if @relation.save
      current_user_topic #recuerda ver si es person o company
    else
      render 'new'
    end
  end

  def show
    @person = Person.find(params[:id])
    #en el view hay que redireccionarlo a repute, o ratyrate
  end

  def edit
    # @person = current_person_by_user
  end

  def update
  end

  def index
    #aqui se pondra los repute
  end

  def destroy 
    Relation.find_by(params[:id]).destroy
    flash[:success] = "Employees update"
    redirect_to company_index_path
  end

private
  def current_user_topic
    if current_user.company
      redirect_to company_index_path
    else
      redirect_to person_index_path
    end
  end

  def rela_params #parámetros fuertes para evitar la vulnerabilidad de asignación de masas 
      params.require(:relation).permit(:sudo, :company_id, :person_id)
  end
end
