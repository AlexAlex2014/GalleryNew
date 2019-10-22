# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        section 'Recent Categories' do
          table_for Category.order('created_at desc').limit(5) do
            column :title
            column :created_at
          end
          strong { link_to 'View All Categories', admin_categories_path }
        end
      end

      column do
        section 'Recent Comments' do
          table_for Comment.order('created_at desc').limit(5) do
            column :commenter
            column :body
            column :image_id do |comment|
              link_to image_tag(comment.image.image.small_thumb.url,
                                alt: 'qqq',
                                title: 'qqqq'),
                      admin_user_comment_path(comment)
            end
            column :created_at
          end
          strong { link_to 'View All Comments', admin_user_comments_path }
        end
      end
    end

    section 'Recent Image' do
      table_for Image.order('created_at desc').limit(10) do
        column :image do |image|
          unless image[:image].nil?
            link_to(image_tag(image.image.small_thumb.url,
                              alt: 'qqq',
                              title: 'qqqq'),
                    admin_image_path(image))
          end
        end
        column :body
        column :category
        column :created_at
      end
      strong { link_to 'View All Images', admin_images_path }
    end

    section 'Recent Actions' do
      act = Action.order('action asc').group_by(&:action)
      @arr_first = []
      act.each_value do |i|
        uniq_item = i.map { |ii| ii[:user_id] }.uniq
        uniq_item.map do |ii|
          arr = []
          i.map do |item|
            arr << item if item.user_id == ii
          end
          @arr_first << arr.first
        end
      end
      table_for @arr_first do
        column 'ID', :id
        column 'Users', :user_id do |email|
          User.where(id: email.user_id).first.email
        end
        column 'Actions', :action do |action|
          link_to action.action, admin_actions_path
        end
        column 'URL', :action_path do |path|
          path.action_path.split('?')[0]
        end
        column :created_at
      end
      strong { link_to 'View All Actions', admin_actions_path }
    end
  end
end
