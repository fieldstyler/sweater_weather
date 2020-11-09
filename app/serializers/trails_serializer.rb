class TrailsSerializer
  include FastJsonapi::ObjectSerializer
  set_id :'nil?'
  set_type :'trail'
  attributes :location, :forecast, :trails
end
