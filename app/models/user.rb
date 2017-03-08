class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable

 has_attached_file :foto, :default_url=>"/assets/images/default.jpg",
   :url=>"/profile/images/:hash.:extension",:hash_secret=>"longSecretString"
 validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
