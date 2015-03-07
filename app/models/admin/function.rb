class Admin::Function < ActiveRecord::Base
  belongs_to :functionable, polymorphic: true
  has_and_belongs_to_many :roles, :class_name => "Admin::Role"
  has_ancestry

  def self.json_tree(nodes)
    nodes.map do |node, subnodes|
      {
        :name => node.name, 
        :url => node.url, 
        :icon => node.icon, 
        :id => node.id, 
        :children => node.children.nil? ? {} : json_tree(node.children).compact 
      } 
    end
  end
end
