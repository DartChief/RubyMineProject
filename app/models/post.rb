class Post < ActiveRecord::Base
  make_flaggable :like
  belongs_to :user
end
