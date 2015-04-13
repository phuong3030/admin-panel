class Admin::Function < ActiveRecord::Base
  has_and_belongs_to_many :roles, :class_name => "Admin::Role"
  has_ancestry

  def self.json_tree(nodes)
    nodes.map do |key, value|
      {
        :name => key.name, 
        :url => key.url, 
        :icon => key.icon, 
        :id => key.id, 
        :children => nodes[key].nil? ? {} : json_tree(nodes[key])
      } 
    end
  end
end
