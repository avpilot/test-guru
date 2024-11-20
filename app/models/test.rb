class Test < ApplicationRecord
  belongs_to :category

  def self.by_category(category)
    includes(:category).where(category: { title: category }).order('tests.title DESC')
                       .pluck(:title)
  end
end
