# frozen_string_literal: true

ActiveAdmin.register ImageLoader do
  permit_params do
    permitted = [:site_path]
    permitted
  end

  controller do
    def create
      ImageLoader.new(site_path: params['image_loader']['site_path']).save
      flash[:notice] = 'Team created successfully'
      redirect_to admin_image_loaders_path
    end

    def show
      params[:site_path] = ImageLoader.find(params[:id])
      show!
    end
  end

  show do
    attributes_table do
      url = params['site_path'].site_path
      base = URI.parse(url.to_s)
      html = URI.parse(url).open
      doc = Nokogiri::HTML(html)
      doc.xpath('//img').each do |img|
        if !img['src'].nil?
          unless img['src'][/((.*\.jpg$)?(.*\.jpeg$)?){1}/] == ''
            src = img['src']
            @normalized = base.merge(URI.parse(src)).to_s
            div link_to image_tag(@normalized),
                        new_admin_image_path(remote_image_url: @normalized.to_s)
          end
        else
          unless img['data-src'][/((.*\.jpg$)?(.*\.jpeg$)?){1}/] == ''
            src = img['data-src']
            @normalized = base.merge(URI.parse(src)).to_s
            div link_to image_tag(@normalized),
                        new_admin_image_path(remote_image_url: @normalized.to_s)
          end
        end
      end
    end
  end
end
