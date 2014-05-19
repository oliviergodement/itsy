class FixColumnName < ActiveRecord::Migration
  def change
    [ 'picture_file_name', 'picture_content_type', 'picture_file_size', 'picture_updated_at' ].each do |old_column_name|
        rename_column :pictures, old_column_name.to_sym, old_column_name.insert(0,'s3').to_sym
    end
  end
end
