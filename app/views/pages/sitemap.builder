xml.instruct!
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

  xml.url{
      xml.loc(root_url)
      xml.changefreq("daily")
      xml.priority(1.0)
  }
  xml.url{
      xml.loc(root_url+'brain-games')
      xml.changefreq("monthly")
      xml.priority(0.9)
  }
  xml.url{
      xml.loc(root_url+'brain-articles')
      xml.changefreq("weekly")
      xml.priority(0.9)
  }
  xml.url{
      xml.loc(root_url+'puzzles-brainteasers')
      xml.changefreq("weekly")
      xml.priority(0.9)
  }
  xml.url{
      xml.loc(root_url+'brain-fitness-games')
      xml.changefreq("monthly")
      xml.priority(0.8)
  }
  xml.url{
      xml.loc(root_url+'brain-fun')
      xml.changefreq("daily")
      xml.priority(0.9)
  }

  Category.all.each do |c|
	  xml.url{
	      xml.loc(root_url + 'brain-articles/'+ c.slug)
	      xml.changefreq("weekly")
	      xml.priority(0.8)
	  }

  end
  GameCategory.all.each do |c|
	  xml.url{
	      xml.loc(root_url + 'brain-games/'+ c.slug)
	      xml.changefreq("monthly")
	      xml.priority(0.8)
	  }

  end

  ExerciseCategory.all.each do |c|
	  xml.url{
	      xml.loc(root_url + 'brain-fitness-games/'+ c.slug)
	      xml.changefreq("monthly")
	      xml.priority(0.7)
	  }

  end

  PuzzleCategory.all.each do |c|
	  xml.url{
	      xml.loc(root_url + 'puzzles-brainteasers/'+ c.slug)
	      xml.changefreq("monthly")
	      xml.priority(0.8)
	  }

  end

  Article.all.each do |c|
	  xml.url{
	      xml.loc(root_url + 'brain-articles/'+ c.category.slug + '/' + c.slug)
	      xml.changefreq("yearly")
	      xml.priority(0.3)
	  }

  end

  Game.all.each do |c|
	  xml.url{
	      xml.loc(root_url + 'brain-games/'+ c.game_categories.first.slug + '/' + c.slug)
	      xml.changefreq("yearly")
	      xml.priority(0.5)
	  }

  end

  Exercise.all.each do |c|
	  xml.url{
	      xml.loc(root_url + 'brain-fitness-games/'+ c.exercise_category.slug + '/' + c.slug)
	      xml.changefreq("yearly")
	      xml.priority(0.5)
	  }

  end

  Post.all.each do |post|
	  xml.url{
	      xml.loc(root_url + 'brain-fun/'+ post.slug)
	      xml.changefreq("yearly")
	      xml.priority(0.2)
	  }

  end

end
