class DucksController < ApplicationController
  before_action :get_duck, only: [:show, :edit]

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.create(duck_params)

    if @duck.valid?
      redirect_to duck_path(@duck)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if get_duck.update(duck_params)
      redirect_to duck_path(@duck)
    else
      render :edit
    end
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

  def get_duck
    @duck = Duck.find(params[:id])
  end
end
