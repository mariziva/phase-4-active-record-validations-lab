class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :is_clickbait

    def is_clickbait
        unless title.present? && title.match?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "No journalistic integrity allowed")
        end
    end
end
