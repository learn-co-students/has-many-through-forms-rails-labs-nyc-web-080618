class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(categories_attributes)
    categories_attributes.each do |i, category_attributes|
      if category_attributes[:name] != ""
        self.categories << Category.find_or_create_by(category_attributes)
      end
    end
  end

end
