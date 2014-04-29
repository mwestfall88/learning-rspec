#builds an xml file using method_missing


class XmlDocument

	def initialize(indent=false)
		@ind = indent
	end
	
	def method_missing(tag, *args, &block)
		#requires *args to be Hash
		tag_out = "<#{tag}"
		if args.length > 0 
			args.each do |hash|
				#allows for more than one argument
				hash.each do |key, value|
					tag_out << " #{key.to_s}='#{value}'"
				end
			end
			tag_out << "/>"
		elsif block
			if @ind
				tag_out << ">\n"
				tag_out << block.call.split("\n").map{|cmd| cmd = "  " + cmd}.join("\n") + "\n"
				#maps the nested blocks and determines their indent level
				tag_out << "</#{tag}>"
			else
				tag_out << ">#{block.call}</#{tag}>"
			end
		else
			if @ind
				tag_out << "/>\n"
			else tag_out << "/>"
			end
		end
		if @ind
			tag_out << "\n"
		end
		return tag_out
	end

end

