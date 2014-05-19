defaults = {
   storage: :s3,
   s3_credentials: {
     bucket: ENV['S3_BUCKET_NAME'],
     access_key_id: ENV['AWS_ACCESS_KEY_ID'],
     secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
   },
   url: ':s3_domain_url',
   path: '/:rails_env/:class/:attachment/:id_partition/:style/:filename'
}

 defaults.each do |key, value|
   Paperclip::Attachment.default_options[key] = value
end
