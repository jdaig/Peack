class RelationController < ApplicationController
  def new
    @kind = Relation.new
  end

  def create
    @relation = Relation.new(sudo:good_params[0], company_id:good_params[1], person_id: good_params[2])
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

  def destroy 
    Relation.find_by(params[:id]).destroy
    flash[:success] = "Employees update"
    redirect_to company_index_path
  end

  def good_params
    if rela_params[:person_id].include?("@")
      @id = User.find_by(email: params[:person_id]).id
    else
      string_param = rela_params[:person_id].split(" ")
      if string_param.count == 2
        @id = Person.find_by(name:string_param[0], lastname:string_param[1]).id
      elsif string_param.count == 1
        @id = Person.find_by(name: string_param[0]).id
      else
        nil
      end
    end
    [rela_params[:sudo] , rela_params[:company_id], @id]
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
