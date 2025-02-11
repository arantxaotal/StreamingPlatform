class Chapter < ApplicationRecord
  belongs_to :season, class_name: Season, foreign_key: :season_id
end
