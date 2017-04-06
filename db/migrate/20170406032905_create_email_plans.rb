class CreateEmailPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :email_plans do |t|
      t.string :name
      t.date :expiration

      t.timestamps
    end
  end
end
