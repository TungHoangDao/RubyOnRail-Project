class CitiesController < ApplicationController
  def new
  end


  def create
    if (City.find_by(name: params[:city][:name]))
      flash[:danger] = "City is already added."
      redirect_to root_path
      return
    end

    @city = City.new(news_params)
    if @city.save
      flash[:success] = "Add new city successfully"
      redirect_to root_path
    else
      flash[:danger] = "City is not exist."
    end
  end

  def destroy
    City.find(params[:id]).destroy
    # flash[:success] = "City cell deleted"
    redirect_to root_path
  end

  private
  def news_params
    params.require(:city).permit(:name)
  end

end
