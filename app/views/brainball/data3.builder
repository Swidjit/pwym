xml.instruct!
xml.info {
	for i in 0..20 do
		choices = (0..23).to_a
	  xml.choices{
	  	for j in 0..9 do
		  	p = choices.delete choices.sample
		    xml.piece(p);
	    end
	  }

  	end
}