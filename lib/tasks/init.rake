namespace :init do

  task :add_tags => :environment do
    ActsAsTaggableOn::Tag.create(:name => "neuroscience")
    ActsAsTaggableOn::Tag.create(:name => "puzzles")
    ActsAsTaggableOn::Tag.create(:name => "brain-teasers")
    ActsAsTaggableOn::Tag.create(:name => "research")
    ActsAsTaggableOn::Tag.create(:name => "brain-fitness")
    ActsAsTaggableOn::Tag.create(:name => "iq-tests")
    ActsAsTaggableOn::Tag.create(:name => "optical-illusions")
    ActsAsTaggableOn::Tag.create(:name => "memory")
    ActsAsTaggableOn::Tag.create(:name => "executive-function")
    ActsAsTaggableOn::Tag.create(:name => "problem-solving")
    ActsAsTaggableOn::Tag.create(:name => "attention")
    ActsAsTaggableOn::Tag.create(:name => "task-swtiching")
    ActsAsTaggableOn::Tag.create(:name => "multi-tasking")
    ActsAsTaggableOn::Tag.create(:name => "language")
    ActsAsTaggableOn::Tag.create(:name => "spatial-processing")
    ActsAsTaggableOn::Tag.create(:name => "reaction-speed")
    ActsAsTaggableOn::Tag.create(:name => "sensory-perception")
    ActsAsTaggableOn::Tag.create(:name => "pattern-recognition")
    ActsAsTaggableOn::Tag.create(:name => "blogs")
    ActsAsTaggableOn::Tag.create(:name => "games")
    ActsAsTaggableOn::Tag.create(:name => "articles")
    ActsAsTaggableOn::Tag.create(:name => "psychology")
    ActsAsTaggableOn::Tag.create(:name => "neuroplasticity")
  end

  task :seed_matches => :environment do
    Match.destroy_all
    start_time = Time.now
    for i in 1..10
      @match = Match.create(:start_time=>start_time, :title => 'Match #'+i.to_s)
      @match.games << Game.find(1)
      @match.games << Game.find(2)
      @match.games << Game.find(3)
      start_time += 2.minutes
    end
  end

  task :seed_games => :environment do
    Game.destroy_all
    Game.create(
      :id=>1,
      :title=>"GridLogic",
      :description=>"Clear the board of all the pieces by strategically eliminating them 1 by 1.",
      :instructions => "Test instructions",
      :round_time => 10,
      :slug => 'GridLogic'
    )
    Game.create(
      :id => 2,
      :title=>"Memory",
      :description=>"Clear the board of all the pieces by strategically eliminating them 1 by 1.",
      :instructions => "Test instructions",
      :round_time => 10,
      :slug => 'Memory'
    )
    Game.create(
      :id => 3,
      :title=>"Spatial",
      :description=>"Clear the board of all the pieces by strategically eliminating them 1 by 1.",
      :instructions => "Test instructions",
      :round_time => 10,
      :slug => 'Memory'
    )
  end

  task :seed_categories => :environment do
    GameCategory.destroy_all
    GameCategory.create(
      :id=>1,
      :title=>"Word Games",
      :description=>""
    )
    GameCategory.create(
      :id=>2,
      :title=>"Logic Games",
      :description=>""
    )
    GameCategory.create(
      :id=>3,
      :title=>"Memory Games",
      :description=>""
    )
    GameCategory.create(
      :id=>4,
      :title=>"Focus Games",
      :description=>""
    )
    GameCategory.create(
      :id=>5,
      :title=>"Spatial Games",
      :description=>""
    )
    GameCategory.create(
      :id=>6,
      :title=>"Search Games",
      :description=>""
    )
    GameCategory.create(
      :id=>7,
      :title=>"Multi-Tasking Games",
      :description=>""
    )
    GameCategory.create(
      :id=>8,
      :title=>"Math Games",
      :description=>""
    )
    GameCategory.create(
      :id=>9,
      :title=>"Eye-Hand Coordintation Games",
      :description=>""
    )
    GameCategory.create(
      :id=>10,
      :title=>"Mouse Games",
      :description=>""
    )
    GameCategory.create(
      :id=>11,
      :title=>"Card Games",
      :description=>""
    )
    GameCategory.create(
      :id=>12,
      :title=>"Miscellaneous Games",
      :description=>""
    )

  end

end