class Load < ActiveRecord::Base
	belongs_to :user
belongs_to :folder
has_attached_file :uploaded_file,
              :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
:url => "/system/:attachment/:id/:basename_:style.:extension"

  do_not_validate_attachment_file_type :uploaded_file
validates_attachment_size :uploaded_file, :less_than => 40.megabytes   
validates_attachment_presence :uploaded_file

def file_name 
    uploaded_file_file_name 
end

def file_size 
uploaded_file_file_size 
end
end
