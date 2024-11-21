class User < ApplicationRecord
  def test_passages(level)
    TestPassage.where(user: self)
               .includes(:test).where(test: { level: level }).joins(:test).pluck(:title)
  end
end
