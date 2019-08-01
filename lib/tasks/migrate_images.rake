namespace :setup do
  desc "a new task to be executed"
  task :migrate_images => :environment do
    path = './app/assets/images/categories'
    Dir.entries(path).map do |dir|
      @dir_name = Category.new
      @dir_name.title = dir
      @dir_name.text = dir
      @dir_name.save
      files = Dir["./app/assets/images/categories/#{dir}/*.jpg"]
      files.each do |file_name|
        if !File.directory? file_name
          File.open("#{file_name}") do |file|
            u = Image.new
            u.image = file
            u.body = dir
            u.category_id = @dir_name[:id]
            u.save!
          end
        end
      end
    end
  end
end

desc 'Configure the application for development.'
task :setup => :environment do
  Rake::Task['setup:migrate_images'].invoke
  # Rake::Task['setup:set_admin_user'].invoke
end
