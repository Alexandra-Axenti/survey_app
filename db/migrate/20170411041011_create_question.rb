class CreateQuestion < ActiveRecord::Migration[5.0]
  def change
    create_table(:questions) do |t|
      t.column(:name, :string)
      t.column(:survey_id, :integer)

      t.timestamps()
    end
  end
end
