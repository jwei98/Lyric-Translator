class AddNameToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :name, :string
  end
end
