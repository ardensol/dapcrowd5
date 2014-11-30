namespace :reffiliate do
  task :generate => :environment do
    User.all.each do |user|
      if user.referral.nil?
        user.create_referral
      end
    end
    puts "Referrals generated."
  end
end