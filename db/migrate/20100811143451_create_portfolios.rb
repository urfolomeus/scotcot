class CreatePortfolios < ActiveRecord::Migration
  def self.up
    create_table :portfolios do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :portfolios
  end
end
