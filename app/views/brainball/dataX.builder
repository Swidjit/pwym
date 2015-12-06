xml.instruct!
xml.info {
	xml.speeds{
		for i in 0..25 do
			r = Random.new
			xml.speed{
				num = r.rand(25..35).to_f/10
				num *= -1 if r.rand() > 0.5

				xml.dx(num)
				num = r.rand(25..35).to_f/10
				num *= -1 if r.rand() > 0.5
				xml.dy(num)
			}

		end
	}
	xml.balls{
		for i in 0..25 do
			r = Random.new
			xml.ball{
				num = r.rand(0..510).to_f/10


				xml.xspot(num)
				num = r.rand(0..450).to_f/10

				xml.yspot(num)
			}

		end
	}
	xml.targs{
		for i in 0..25 do
			r = Random.new
			xml.targ{
				num = r.rand(0..510).to_f/10


				xml.xspot(num)
				num = r.rand(0..430).to_f/10

				xml.yspot(num)
			}

		end
	}
}
