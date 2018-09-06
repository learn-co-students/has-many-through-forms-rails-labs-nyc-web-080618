class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :post

  def user_attributes=(user_attributes)
    if user_attributes[:username] != ""
      self.user = User.find_or_create_by(user_attributes)
    end
  end

end
