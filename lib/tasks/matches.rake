namespace :matches do
  task :update_status => :environment do
    Match.where(:status => 'enrolling').where('start_time < ?',Time.now+10.minutes).update_all(:status=>'active')
    Match.where(:status => 'active').where('start_time < ?',Time.now+1.minute).update_all(:status=>'countdown')
    Match.where(:status => 'countdown').where('start_time < ?',Time.now).update_all(:status=>'playing', :round_num => 1)
  end
end