require 'carrierwave/orm/activerecord'
class Lot < ActiveRecord::Base

  mount_uploader :attachment, AttachmentUploader

  
end
