class CardsController < ApplicationController
  def new
  end


  def update
    UserSettingController.update_sub_path "verification"
    UserSettingController.lock_setting_path
    if card_params
      @card = Card.find(params[:id])
      if @card.valid?
        if @card.update_attributes(card_params)
          flash[:success] = "Verification updated"
          redirect_to settings_setting_path
        else
          render 'user_setting/setting'
        end
      else
        flash[:danger] = "Input is missing"
        render 'user_setting/setting'
      end
    else
      flash[:danger] = "Input is missing"
      render 'user_setting/setting'
    end
  end

  private

  def card_params
    params.require(:card).permit(:student_full_name, :student_number, :picture)
  end

end
