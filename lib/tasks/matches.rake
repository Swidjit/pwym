namespace :matches do
  task :update_status => :environment do
    Match.where(:status => 'enrolling').where('start_time < ?',Time.now+10.minutes).update_all(:status=>'active')

    Match.where(:status => 'active').where('start_time < ?',Time.now+1.minute).update_all(:status=>'countdown')

    Match.where(:status => 'countdown').where('start_time < ?',Time.now).each do |m|
      game = m.games.offset(m.round_num).first
      m.update_attributes(:status=>'playing', :round_num => 1, :next_round_time => Time.now + (game.round_time).seconds)
    end

    Match.where(:status => 'playing').where('next_round_time < ?',Time.now).each do |m|
      if m.round_num < m.games.count
        game = m.games.offset(m.round_num).first
        m.update_attributes(:round_num => m.round_num+1, :next_round_time => Time.now + (game.round_time).seconds)
      else
        m.update_attribute(:status,'complete')
      end
    end

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