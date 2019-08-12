ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    section "Recent Categories" do
      table_for Category.order("created_at desc").limit(5) do
        column :title
        column :created_at
      end
      strong { link_to "View All Categories", admin_categories_path }
    end

    section "Recent Comments" do
      table_for Comment.order("created_at desc").limit(5) do
        column :commenter
        column :body
        column :image_id do |comment|
          link_to image_tag(comment.image.image.small_thumb.url, alt: "qqq", title: "qqqq"), admin_user_comment_path(comment)
        end
        column :created_at
      end
      strong { link_to "View All Comments", admin_user_comments_path }
    end

    section "Recent Image" do
      table_for Image.order("created_at desc").limit(10) do
        column :image do |image|
          link_to(image_tag(image.image.small_thumb.url, alt: "qqq", title: "qqqq"), admin_image_path(image)) unless image[:image].nil?
        end
        column :body
        column :category
        column :created_at
      end
      strong { link_to "View All Images", admin_images_path }
    end

    section "Recent Actions" do
      table_for Action.order("action desc") do
        column "Users", :user_id do |email|
          User.where(id: email.user_id).first.email
        end
        column "Actions", :action do |action|
          link_to action.action, admin_actions_path
          # raise ddfd
        end
        column "URL", :action_path do |path|
          path.action_path.split("?")[0]
        end
        column :created_at
      end
      strong { link_to "View All Actions", admin_actions_path }
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
