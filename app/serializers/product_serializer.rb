class ProductSerializer < ActiveModel::Serializer
  # include Rails.application.routes.url_helpers
  attributes :id ,:name,:description,:alphanumeric_id,:price,:image

  def image
    # byebug
    # url_for(rails_blob_path(object.image))
    # rails_blob_path(object.image, disposition: "attachment", only_path: true)
    # object.image.filename
      # rails_blob_path(object.image, disposition: "attachment")#, only_path: true)
     Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true) if object.image.attached?
    # rails_blob_path(object.image,only_path:true)
  end
end
