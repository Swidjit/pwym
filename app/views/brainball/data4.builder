xml.instruct!
xml.info {
	r = Random.new
	for i in 0..64 do
		num = r.rand(5..60)
		xml.num(num);

  	end
}