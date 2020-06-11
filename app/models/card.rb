class Card < ApplicationRecord
  mount_uploader :picture, PictureUploader

  def card_image
    return self.picture.length > 0 ? self.picture.url : ""
  end
end
