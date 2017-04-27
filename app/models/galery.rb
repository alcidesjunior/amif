class Galery < ApplicationRecord
  has_attached_file :imagem,
  :styles=>{:thumb => "100x100#",:small  => "150x150>", :medium => "300x300"}, :default_url=>"/assets/galery/default.jpg",
    :url=>"/assets/galery/:hash.:extension",:hash_secret=>"longSecretString"
  validates_attachment_content_type :imagem, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
