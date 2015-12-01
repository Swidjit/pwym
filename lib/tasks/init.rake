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
      :description=>"If you enjoy word jumbles, crossword puzzles, Scrabble, or any of the various online word games floating around the internet, these are the games for you. Create, find, re-assemble, unscramble and otherwise play with words in these fun and challenging verbal games."
    )
    GameCategory.create(
      :id=>2,
      :title=>"Logic Games",
      :description=>"Are you one of those people that loves that triangular peg-jumping game? How about Sudoku puzzles? If so, you should definitely take some time to explore the various logic puzzles, games and tests in this section. If you like tasks that require planning and strategy, you will find plenty of that here."
    )
    GameCategory.create(
      :id=>3,
      :title=>"Memory Games",
      :description=>"The numerous memory games and tests in this category will challenge your memory in all sorts of different ways. Work to remember patters, shapes, associations, images and more. If you are looking for even more practice, check out the exercises in the memory section of our mind exercises."
    )
    GameCategory.create(
      :id=>4,
      :title=>"Focus Games",
      :description=>"These mind games will challenge your attention and focus skills. Pay attention to multiple objects at once, keep track of items “in the dark” and try to piece together moving puzzles."
    )
    GameCategory.create(
      :id=>5,
      :title=>"Spatial Games",
      :description=>"These games and puzzles challenge your ability to arrange, remember and generally perceive the position of objects in space."
    )
    GameCategory.create(
      :id=>6,
      :title=>"Search Games",
      :description=>"Look for hidden objects like words, letters, patterns, pictures and more in these fun online search games. Includes the Zirch family of games."
    )
    GameCategory.create(
      :id=>7,
      :title=>"Multi-Tasking Games",
      :description=>"These multi-tasking games will challenge your ability to handle more than one task at the same time. These are great practice for juggling multiple activities, especially computing ones."
    )
    GameCategory.create(
      :id=>8,
      :title=>"Math Games",
      :description=>"Practice your math and number skills with these free online math games from Play With Your Mind. These games will have you building equations, arranging numbers into mathematical, relationships, performing speedy mental math and more."
    )
    GameCategory.create(
      :id=>9,
      :title=>"Eye-Hand Coordintation Games",
      :description=>""
    )
    GameCategory.create(
      :id=>10,
      :title=>"Mouse Games",
      :description=>"Try out these unusual challenge and games that task you to perform challenging feats with your mouse. Skillfully dodge flying objects or try to accomplish simple tasks with a misbehaving mouse."
    )
    GameCategory.create(
      :id=>11,
      :title=>"Card Games",
      :description=>"These challenging online games and puzzles are played with decks of cards. Do not expect to find hearts, spades, bridge or poker here – these are original card games available only on this website."
    )
    GameCategory.create(
      :id=>12,
      :title=>"Miscellaneous Games",
      :description=>"These online games defy categorization but are sure to challenge your mind in unusual ways. Practice your sense of timing, your ability to estimate, and more."
    )


    Category.destroy_all
    Category.create(
      :id=>1,
      :title=>"Brain Fitness News",
      :description=>"All the latest news and findings from the brain fitness industry about brain training, brain workouts & the science of neuroplasticity."
    )
    Category.create(
      :id=>2,
      :title=>"Brain Fitness Tips",
      :description=>"There are a number of different ways to improve your brain fitness aside from playing games. The following is a collection of different ideas on how to improve and maintain your mind."
    )
    Category.create(
      :id=>3,
      :title=>"Site News",
      :description=>"News and updates about playwithyourmind.com"
    )
    Category.create(
      :id=>4,
      :title=>"Neuroscience",
      :description=>"Information and discussion of the latest findings in neuroscience, specifically those regarding the science of neuroplasticity."
    )
    GameCategory.find_by_slug('logic-games').update_attribute(:slug,'logic-puzzles')
  end
  task :seed_puzzles => :environment do
    PuzzleCategory.destroy_all
    PuzzleCategory.create(
      :id=>1,
      :count=>12,
      :title=>"Word Toggle",
      :slug=>"word-toggle",
      :description=>"Make the necessary number of adjustments to turn the nonsense string into a word",
      :instructions=>"The goal of this brainteaser is to toggle the letters up or down in the alphabet to create an English word. Each puzzle consists of a string of nonsense letters as well as a number indicating how many moves you are allowed to make. Starting from here, you need to make adjustments to some or all of the letters in order to arrive at a real word. For example, you might take the puzzle ‘DOART (6)’ and adjust it to make the word ‘CLASS’ by moving D -> C, O -> L, R -> S & T -> S which is a total of 6 moves up or down in the alphabet. Notice that the letter A did not get adjusted – you are free to leave some letters unchanged. New puzzles added weekly."
    )
    PuzzleCategory.create(
      :id=>2,
      :count=>16,
      :title=>"Word Tease",
      :slug=>"word-tease",
      :description=>"",
      :instructions=>"The object of this puzzle is to tease apart two different words of equal length from the nonsense string of characters. The letters must appear in the string in the same order as they appear in each respective word. For instance, from the string ‘BAUDDY’ you can tease out the words ‘BUY’ and ‘ADD’. You could not make the word ‘DAY’ because the D comes after the A. Each puzzle consists of 4 different word teases, one for 4-letter words, 5-letter words, 6-letter words and 7-letter words. Write down the letters on a piece of scrap paper and try to work them out. Once you have figured worked the puzzle to your satisfaction, you can click on it to reveal the answers. New puzzles added weekly."
    )
    PuzzleCategory.create(
      :id=>3,
      :count=>14,
      :title=>"Blankout",
      :slug=>"blankout",
      :description=>"",
      :instructions=>"The object of this puzzle is to fill in the blanks with the available numbers such that the mathematical equation holds true. There are more empty spots than numbers, meaning that one or more of the numbers must be used more than once. New puzzles added weekly."
    )
    PuzzleCategory.create(
      :id=>4,
      :count=>1,
      :title=>"Word Grid",
      :slug=>"word-grid",
      :description=>"",
      :instructions=>"This is a difficult game to understand, but it’s a good one so well worth the effort to try. The puzzle consists of a grid of letters. Your job is to portion off different vertical & horizontal sections such that all letters are accounted for, and all designated sections can be unscrambled into (3, 4 or 5-letter) words. So it is both a matter of recognizing word jumbles and also finding an arrangement such that all letters are incorporated into one of these jumbles. You need not ever move the letters, they should stay where they are, even if jumbled. For this puzzle, since it is confusing, there is a link in the game to an instructions page with a graphical representation of what you need to do."
    )
  end

  task :import_data => :environment do
    require 'rexml/document'
    include REXML

    xmlfile = File.new("pwym.xml")
    xmldoc = Document.new(xmlfile)
    Article.destroy_all
    Game.destroy_all
    # Now get the root element
    root = xmldoc.root
    # This will output all the movie titles.
    xmldoc.elements.each("rss/channel/item") do |e|

      if e.elements["category"].present? && e.elements["wp:status"].text == "publish"
        e.each_element_with_attribute("domain","category") do |a|
          puts a.attributes["nicename"]
          c = Category.where(:slug=>a.attributes["nicename"]).first
          if c.present?
            a = Article.new(:title => e.elements["title"].text, :body => e.elements["content:encoded"].text,:created_at => e.elements["wp:post_date"].text, :category=>c)
            a.save
          end
          c = GameCategory.where(:slug=>a.attributes["nicename"]).first
          if c.present?
            a = Game.new(:title => e.elements["title"].text, :description => e.elements["excerpt:encoded"].text,:created_at => e.elements["wp:post_date"].text)
            a.save
            c.games << a
          end
        end
      end
    end
  end

end