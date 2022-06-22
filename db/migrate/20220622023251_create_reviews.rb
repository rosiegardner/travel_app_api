class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :content, :string
    end
  end
end
