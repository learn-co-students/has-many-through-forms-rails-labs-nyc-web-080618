class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories


  def post_categories=(categories)
    categories.each do |category|
      if category.name != ""
        self.categories << Category.find_or_create_by(name: category.name)
      end
    end
  end

end
