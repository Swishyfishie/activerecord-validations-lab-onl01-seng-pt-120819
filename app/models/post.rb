class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates :is_clickbait?
end

array_of_titles = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

def is_clickbait?
    array_of_titles.each do |t|
        if self.title.include?(t)
          errors.add(:title, "clickbaittttttttt")
        end
    end
end