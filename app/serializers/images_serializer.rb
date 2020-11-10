class ImagesSerializer
  include FastJsonapi::ObjectSerializer
  set_type :'image'
  set_id :'nil?'
  attributes :image
end
