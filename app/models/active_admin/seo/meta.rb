class ActiveAdmin::Seo::Meta < ActiveRecord::Base
  self.table_name = "active_admin_seo_meta"
  belongs_to :seoable, :polymorphic => true

  unless Rails::VERSION::MAJOR > 3 && !defined? ProtectedAttributes
    attr_accessible :slug, :title, :description, :keywords,
                    :og_description, :og_site_name, :og_title, :og_type, :og_url
  end

  # image_accessor :og_image

  unless Rails::VERSION::MAJOR > 3 && !defined? ProtectedAttributes
    attr_accessible :og_image, :og_image_url, :retained_og_image, :remove_og_image
  end

  # validates_size_of :og_image, :maximum => 3.megabyte
  # validates_property :format, :of => :og_image, :in => [:jpeg, :jpg, :png], :case_sensitive => false

  validates :title, :description, :keywords, :length => { :maximum => 160 }
end
