class Comment < ApplicationRecord
  # include Visible

  belongs_to :user
end
