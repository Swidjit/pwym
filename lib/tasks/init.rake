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

  task :seed_exercise_cats => :environment do
    ExerciseCategory.destroy_all
    Exercise.destroy_all

    ExerciseCategory.create(
      :id=>1,
      :title=>"Attention & Focus",
      :slug=>"attention-focus-exercises",
      :description=>"Exercise your ability to concentrate on a task with these various attention and focus tasks. Train your brain to be stronger and younger with brain games and exercises."
    )
    ExerciseCategory.create(
      :id=>2,
      :title=>"Eye-Hand Coordination",
      :slug=>"eye-hand-coordination",
      :description=>"Practice your ability to coordinate your hand movements (in this case, your mouse and keyboard) with visual information."
    )
    ExerciseCategory.create(
      :id=>3,
      :title=>"Memory",
      :slug=>"memory-exercises",
      :description=>"Memory exercises and games to help sharpen your mind and improve your brain fitness."
    )
    ExerciseCategory.create(
      :id=>4,
      :title=>"Problem Solving",
      :slug=>"problem-solving-exercises",
      :description=>"Exercise your planning and problem solving skills with these logic and planning puzzles."
    )
    ExerciseCategory.create(
      :id=>5,
      :title=>"Number Processing",
      :slug=>"number-exercises",
      :description=>"Being able to perform a little mental math is not only useful, but it is also an effective way to exercise your mind in everyday situations as it subtly works out a variety of mental processes. This might be one of the most rewarding things to exercise as your progress will be immediate and clear. The games here offer you several different ways to work with numbers and improve these skills."
    )
    ExerciseCategory.create(
      :id=>6,
      :title=>"Visual-Spatial",
      :slug=>"visual-spatial-exercises",
      :description=>"Our ability to judge spaces serves many roles in our lives, from safely navigating through traffic, to planning a future house, to the everyday process of pattern matching. These various games and exercises to help you make these sorts of judgments quickly and accurately."
    )

    Exercise.create(
      :id=>1,
      :title=>'Pattern Match',
      :slug => 'pattern-match',
      :description => 'The object of this game is to match the line patterns. Each group of lines has one exact copy on the board that you need to find and match. The difficulty in this game is that each group of lines is rotated at a random angle.',
      :exercise_category_id => 6
    )
    Exercise.create(
      :id=>2,
      :title=>'Number Crunch',
      :slug => 'number-crunch',
      :description => 'The object of this exercise is to eliminate numbers from the grid by clicking on them in numerical order. The faster you can scan the grid and determine the lowest number, the better you will perform at this game.',
      :exercise_category_id => 6
    )
    Exercise.create(
      :id=>3,
      :title=>'Color Puzzle',
      :slug => 'color-puzzle',
      :description => 'This exercise is very similar to a jigsaw puzzle. You will be given a grid of colors with some pieces missing. To the left are these missing pieces. To play, simply place each of the pieces into the appropriate spot. The piece must match colors on all four sides in order to fit.',
      :exercise_category_id => 6
    )
    Exercise.create(
      :id=>4,
      :title=>'Number Group',
      :slug => 'number-group',
      :description => 'This is a game of math and numbers. You will be presented with a grid of pieces containing random numbers between 5-50. The goal is to pull pieces from the grid in groups that total 100 (or as close to 100 as possible). For instance, you if you playing a 13, 47, 30 and 10 together would comstitute a 100 group.',
      :exercise_category_id => 5
    )
    Exercise.create(
      :id=>5,
      :title=>'Eliminate Pieces',
      :slug => 'eliminate-pieces',
      :description => 'The object of this game is eliminate the pieces in the board and hopefully finish with just one piece remaining. To play, drag adjacent pieces onto one another and the bottom piece will disappear and be replaced by the top piece. You may may only play a piece onto another if they are vertically, horizontally or diagonally adjacent AND they contain an overlapping element (color, shape or number). Using these rules, strategically eliminate the pieces from the board one by one.',
      :exercise_category_id => 4
    )
    Exercise.create(
      :id=>6,
      :title=>'Arrange Colors',
      :slug => 'arrange-colors',
      :description => 'The object of this exercise is to arrange the colored pieces such that no two adjacent pieces are the same color. Switch any two pieces on the board simply by dragging one onto another other. Continue doing so until you have eliminated all adjacent colors (horizontal, vertical or diagonal).',
      :exercise_category_id => 4
    )
    Exercise.create(
      :id=>7,
      :title=>'Retroception',
      :slug => 'retroception',
      :description => 'In the game of Retroception, you will be trying to click on targets after they disappear, making it an exercise of iconic memory. In the beginning of each round there will be a number of targets visible on your screen. Each target has three different zones: an outer zone, a middle zone, and in inner zone. The goal is to try to click as close as possible to where the target was, before it disappeared.',
      :exercise_category_id => 3
    )
    Exercise.create(
      :id=>8,
      :title=>'Scheduling',
      :slug => 'scheduling',
      :description => 'This is a very straight-forward memory exercise. You will be presented with a list of activities for the day, each happening at a specific time. You will have a couple seconds to process each activity as it is presented. Once you have seen all the activities, you will be presented with a blank schedule and then asked to fill it in, event by event.',
      :exercise_category_id => 3
    )
    Exercise.create(
      :id=>9,
      :title=>'Window Memory',
      :slug => 'window-memory',
      :description => 'In this memory exercise, there are several different “windows”, each containing a different set of letters. These are “windows” in the computer sense, meaning that they are each independent spaces, and you can switch back and forth between them as needed. If you have trouble with this concept, you can just as easily consider them each separate drawers or rooms containing different letters.',
      :exercise_category_id => 3
    )
    Exercise.create(
      :id=>10,
      :title=>'Color Match',
      :slug => 'color-match',
      :description => 'In this memory exercise, you need to clear the board of pieces by matching like colors. More specifically, you need to make a match between a piece from the grid on the right with a piece from the grid on the left. This is like the classic game of ‘Memory’ except that you are working with colors instead of shapes and with two grids instead of one.',
      :exercise_category_id => 3
    )
    Exercise.create(
      :id=>11,
      :title=>'BallGrab',
      :slug => 'ballgrab',
      :description => 'The object of this exercise is absurdly simple: grab the balls and drop them into the hole. Actually executing it however is a little more difficult as both the balls and the hole are moving around the screen. Herein lies the eye-hand coordination challenge as you need to skillfully move your mouse to catch the balls in the first place and then carefully drag them onto the moving hole. You need to place the balls entirely within the hole in order for it to count; otherwise the ball will return to the field and continue bouncing.',
      :exercise_category_id => 2
    )
    Exercise.create(
      :id=>12,
      :title=>'BallDodge',
      :slug => 'balldodge',
      :description => 'In this exercise, you need to try and move around collecting the targets while simultaneously avoiding the moving balls. Carefully navigate this piece around the board collecting the targets in order – the current target you need to get is highlighted for convenience. As you do this, you need to avoid making contact with any of the blue balls careening around the board for you will lose energy for every moment you are in contact with them.',
      :exercise_category_id => 2
    )
    Exercise.create(
      :id=>13,
      :title=>'KeyPress',
      :slug => 'keypress',
      :description => 'This is a game of eye-hand coordination as you need to coordinate what you see on the screen with quick and accurate keystrokes. The game board consists of a number of vertical columns, each labeled by a letter at bottom. During game play, balls will fall one by one through one of these columns and your job is to capture them as quickly as possible with the appropriate keystroke.',
      :exercise_category_id => 2
    )
    Exercise.create(
      :id=>14,
      :title=>'WallBalls',
      :slug => 'wallballs',
      :description => 'The object of this brain exercise is straight-forward: keep the balls away from the edge. The trick is that there are many balls but you can only see one of them at any given time. Much like you would have different windows open to run different applications while using your computer, each ball exists in a different window and you must switch back and forth between windows to manage the different balls.',
      :exercise_category_id => 1
    )
    Exercise.create(
      :id=>15,
      :title=>'Focal Points',
      :slug => 'focal-points',
      :description => 'This is a game of focus. Your job is to pay very careful attention to each of the sliding numbers on the gameboard. As the sliders move back and forth, you need to press the associated number each time it passes over one of the red target areas. If you successfully do so, the slider will light up green to indicate that you caught the target.',
      :exercise_category_id => 1
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