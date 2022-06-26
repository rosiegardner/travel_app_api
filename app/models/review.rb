class Review < ApplicationRecord  
  validates :author, presence: true
  validates :content, presence: true

  def self.search(search)
    if search
      where(["author ILIKE ?","%#{search}%"])
    else
      all
    end
  end
end