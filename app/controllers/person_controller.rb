class PersonController < ApplicationController
  def new
    @kind = Person.new
  end

  def show
    @person = current_person_by_user
  end

  def create
    @person = Person.new(info_params)
    if @person.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @person = current_person_by_user
  end

  def update
    @person = current_person_by_user
    if @person.update(info_params)
      flash[:success] = "Profile updated"
      redirect_to @person
    else
      render 'edit'
    end
  end

  def index
    @person = current_person_by_user
    #aqui se pondra los repute
  end

  def search
    @person = Person.new
  end

  def find
    @person_array = []
    Person.all.each{|person|
      if person.name == search_params[:name] || person.ocupation == search_params[:ocupation]
        @person_array << person
      end
    }
    @person_array
  end
private
  def current_person_by_user
    current_user.person
  end

  def info_params #parámetros fuertes para evitar la vulnerabilidad de asignación de masas 
      params.require(:person).permit(:name, :lastname, :born, :ocupation, 
                                   :soc_stat, :page, :description, :user_id)
  end

  def search_params
    params.require(:person).permit(:name, :ocupation)
  end
end
