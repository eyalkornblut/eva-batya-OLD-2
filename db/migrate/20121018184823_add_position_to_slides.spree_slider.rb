# This migration comes from spree_slider (originally 20120816192758)
class AddPositionToSlides < ActiveRecord::Migration
  def change
    add_column :spree_slides, :position, :integer, :null => false, :default => 0
  end
end
