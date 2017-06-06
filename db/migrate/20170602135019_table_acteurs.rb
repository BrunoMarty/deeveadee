class TableActeurs < ActiveRecord::Migration[5.1]
  def change
    create_table :acteurs
    add_column :acteurs, :nom, :varchar
    add_column :acteurs, :prenom, :varchar
    add_column :acteurs, :date, :date
    add_column :acteurs, :sexe, :boolean
  end
end
