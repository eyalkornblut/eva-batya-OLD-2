# app/models/spree/asset_decorator.rb
[ Spree::Content, Spree::PageImage, Spree::Upload ].each do |cls| 
  cls.attachment_definitions[:attachment].merge!(
    :storage        => 's3',
    :s3_credentials => Rails.root.join('config', 's3.yml'),
    :path           => "/:class/:id/:style/:basename.:extension"
  )
end