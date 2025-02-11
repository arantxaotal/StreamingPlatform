class App < ApplicationRecord
  belongs_to :content, class_name: Content, foreign_key: :content_id
end
