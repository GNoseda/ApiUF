class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :name
      t.string :request

      t.timestamps
    end
  end
end
