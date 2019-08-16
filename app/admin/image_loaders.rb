ActiveAdmin.register ImageLoader do

  permit_params do
    permitted = [
        :site_path
    ]
    permitted
  end

  controller do
    def create
      ImageLoader.new(site_path: params["image_loader"]["site_path"]).save
      flash[:notice] = 'Team created successfully'
      redirect_to admin_image_loaders_path
    end
      # redirect_back(fallback_location: root_path)
      # redirect_to request.referrer
    def show
      params[:site_path] = ImageLoader.find(params[:id])
      show!
    end
  end

  show do
    attributes_table do
      url = params["site_path"].site_path
      base = URI.parse(url.to_s)
      html = open(url)
      doc = Nokogiri::HTML(html)
      doc.xpath('//img').each do |img|
        unless img["src"] == nil
          unless img["src"][/((.*\.jpg$)?(.*\.jpeg$)?){1}/] == ""
            src = img["src"]
            @normalized = base.merge(URI.parse(src)).to_s
            div link_to image_tag(@normalized), new_admin_image_path(:remote_image_url => "#{@normalized}") # , :method => :post #do
            # raise gg
             #  u = Image.new
             #  u.remote_image_url = @normalized.itself
             #  u.category_id = 278
             #  u.save!
             # end
          end
        else
          unless img["data-src"][/((.*\.jpg$)?(.*\.jpeg$)?){1}/] == ""
            src = img["data-src"]
            @normalized = base.merge(URI.parse(src)).to_s
            div link_to image_tag(@normalized), new_admin_image_path(:remote_image_url => "#{@normalized}") # , :method => :post
          end
        end
      end
    end
  end
end
