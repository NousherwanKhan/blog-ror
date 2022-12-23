class Blog < ApplicationRecord

 belongs_to :admin_user
 has_one_attached :image

 scope :sorted, lambda{order('id ASC')}

  def image_as_thumbnails
    image.variant(resize_to_limit: [100, 100]).processed
  end

  def image_as_card
    image.variant(resize_to_limit: [300, 300]).processed
  end
  def image_as_medium
    image.variant(resize_to_limit: [500, 500]).processed
  end

private
  def after_confirmation
    ModelMailer.send_greeting_notifications(self).deliver_now
  end
end
