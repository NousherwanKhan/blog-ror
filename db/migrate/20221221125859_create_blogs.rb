class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.references :admin_user, index: true, foreign_key: true
      t.string  :title
      t.string  :description
      t.timestamps

    end
  end
end
