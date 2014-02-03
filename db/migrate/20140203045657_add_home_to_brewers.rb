class AddHomeToBrewers < ActiveRecord::Migration
  def change
    add_reference :brewers, :home_base, index: true
  end
end
