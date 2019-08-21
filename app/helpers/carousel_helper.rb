module CarouselHelper
  def carousel_for(category_images)
    Carousel.new(self, category_images).html
  end

  class Carousel
    def initialize(view, category_images)
      @view, = view
      @category_images = category_images
      @images = category_images.values
      @uid = SecureRandom.hex(6)
    end

    def html
      content = safe_join([indicators, slides, controls])
      content_tag(:div, content, id: uid, class: 'carousel slide', "data-ride" => "carousel")
    end

    private

    attr_accessor :view, :images, :uid, :category_images
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

    def indicators
      items = images.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
      options = {
          class: (index.zero? ? 'active' : ''),
          data: {
              target: "##{uid}",
              slide_to: index
          }
      }
      content_tag(:li, '', options)
    end

    def slides
      items = images.map.with_index { |image, index| slide_tag(image, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')
    end

    def carousel_caption(image)
      @category_name = []
      @category_images.each do |value|
        @category_name = value[0].title if value[1] == image
      end

      content_tag(:h4, "Category <span>'#{@category_name}'</span> - it is the most popular category".html_safe, class: 'carousel-caption d-none d-md-block')
      # raise ff
    end

    def slide_tag(image, is_active)
      options = {
          class: (is_active ? 'item active' : 'item'),
      }

      content_tag(:div, safe_join([image_tag(image.image.url), carousel_caption(image)]), options)
    end

    def controls
      safe_join([control_tag('left'), control_tag('right')])
    end

    def control_tag(direction)
      options = {
          class: "#{direction} carousel-control",
          data: { slide: direction == 'left' ? 'prev' : 'next' }
      }

      icon = content_tag(:span, '', class: "glyphicon glyphicon-chevron-#{direction}")
      control = link_to(icon, "##{uid}", options)
    end
  end
end