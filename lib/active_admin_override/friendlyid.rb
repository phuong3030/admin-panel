ActiveAdmin::ResourceController.class_eval do
  def find_resource
    id_field = "id"

    if scoped_collection.is_a? FriendlyId
      id_field = scoped_collection.friendly_id_config.query_field
    end

    scoped_collection.find_by! id_field => params[:id]
  end
end
