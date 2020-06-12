class StaticPagesController < ApplicationController
  def home
    @cities = City.all
    @dicTime = Hash.new
    @dicType = Hash.new

    @cities.each do |city|
      Time.zone = city.name
      currentTime = Time.zone.now
      @dicTime[city.name] = currentTime
    end
  end

  def help
  end


 def about 
 end

 def contact
  end

  def sign_up
  end

  def sign_in
  end
  
end
