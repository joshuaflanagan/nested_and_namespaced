class Blog::Comment < ActiveRecord::Base
  belongs_to :post
end
