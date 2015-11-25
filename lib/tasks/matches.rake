namespace :matches do
  task :update_status => :environment do
    Match.where(:status => 'enrolling').where('start_time < ?',Time.now+10.minutes).update_all(:status=>'active')
    Match.where(:status => 'active').where('start_time < ?',Time.now+1.minute).update_all(:status=>'countdown')
    Match.where(:status => 'countdown').where('start_time < ?',Time.now).update_all(:status=>'playing', :round_num => 1)
    Match.where(:status => 'complete').each do |m|
      require 'descriptive_statistics'
      m.games.each do |g|
        data = RoundScore.where(:match=>m,:game=>g).pluck(:score)
        dev = data.standard_deviation
        puts m.id,g.id
        RoundScore.where(:match=>m,:game=>g).each do |s|
          puts s
          puts 'hey'
          diff = s.score - data.mean
          num_devs = diff/dev.to_f
          s.update_attributes(:raw_score => 500 + (100*num_devs), :percentile => data.percentile_rank(s.score))
        end
      end
    end

  end

  task :clear => :environment do
    Match.destroy_all
  end
end