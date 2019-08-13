ActiveAdmin.register_page "ImageLoader" do
  content do
    render partial: 'form'
  end
end

#
# require 'nokogiri'
# require 'open-uri'
# require 'uri'
# require 'pathname'
#
# url = 'http://www.cubecinema.com/programme'
# base = URI.parse(url)
#
# html = open(url)
# doc = Nokogiri::HTML(html)
#
# doc.css('img').each do |img|
#   src = img[:src]
#   normalized = base.merge(URI.parse(src)).to_s
#   filename = Pathname.new(normalized).basename
#
#   open(normalized) do |img_file|
#     File::open(filename, 'wb') do |f|
#       f.write(img_file.read)
#     end
#   end
# end








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