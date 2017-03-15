class Modalidade < ApplicationRecord
  has_attached_file :imagem,
    :url=>"/modalidades/images/:hash.:extension",
    :hash_secret=>"longSecretString",
    :styles=> {original: "780x567>"}
  validates_attachment_content_type :imagem, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
