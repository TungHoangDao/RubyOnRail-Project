class StaticPagesController < ApplicationController
  def home
    Time.zone = "Melbourne";
    @currentTime = Time.zone.now.strftime '%H:%M'
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
