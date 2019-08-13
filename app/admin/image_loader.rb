ActiveAdmin.register_page "ImageLoader" do
  content do
    render partial: 'form'
  end
end








# ActiveAdmin.register Image do
#   form multipart: true do |f|
#     f.inputs do
#       f.input :name
#
#       f.has_many :images do |p|
#         p.input :url
#       end
#     end
#
#     f.actions
#   end
# end
#
#
# ActiveAdmin.register Gallery do
#   form html: { multipart: true }  do |f|
#     f.inputs  do
#       f.input :name
#       file_field_tag("gallery_images_url", multiple: true, name: "gallery[gallery_images_attributes][][url]")
#     end
#     f.buttons
#   end
# end