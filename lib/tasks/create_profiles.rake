task :create_profile => :environment do
 User.all.each do |user|
    if user.profile.nil?
       user.build_profile
       user.save
    end
  end
end