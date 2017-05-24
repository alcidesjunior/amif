class Daily < ApplicationRecord
  belongs_to :atletum
  belongs_to :modalidade
  belongs_to :professor
end
