# app/models/spree/upload_decorator.rb
Spree::Upload.attachment_definitions[:attachment].merge!(
  :storage        => 's3',
  :s3_credentials => Rails.root.join('config', 's3.yml'),
  :path           => "/uploads/:id/:style/:basename.:extension"
)