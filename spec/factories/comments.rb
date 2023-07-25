FactoryBot.define do
  factory :comment do
    content { "jffjfofdjofdfjofjfofjfofjofjffofjofjfofjof" }

    factory :comment_empty do

      content { "" }

    end
  end
end
