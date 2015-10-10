class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.json :android_device, null: false
      t.json :cave_survey_app, null: false
      t.json :request, null: false
      t.string :text, null: false

      t.timestamps null: false
    end
  end
end
