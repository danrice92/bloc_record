module ErrorHandling
  def method_missing(method_name, *args)
    if method_name.match(/find_by_/)
      attribute = method_name.to_s.split('find_by_')[1]
      if columns.include?(attribute)
        self.find_by(attribute, args.first)
      else
        puts "#{attribute} does not exist in the database -- please try again."
      end
    elsif method_name.match(/update_/)
      attribute = method_name.to_s.split('update_')[1]
      if self.class.columns.include?(attribute)
        self.class.update(self.id, { attribute => args.last } )
      else
        puts "#{attribute} does not exist in the database -- please try again."
      end
    else
      super
    end
  end
end
#
# module ErrorHandling
#   def method_missing(method_name, *args)
#     puts args
#     if method_name.match(/find_by_/)
#       attribute = method_name.to_s.split('find_by_')[1]
#       if columns.include?(attribute)
#         self.find_by(attribute, args.first)
#       else
#         puts "#{attribute} does not exist in the database -- please try again."
#       end
#     elsif method_name.match(/update_/)
#       puts "update path"
#       puts args
#       # attribute = method_name.to_s.split('update_')[1]
#       # p attribute
#       # self.update_attribute(self.id, { attribute => args.last } )
#     else
#       puts "super path"
#       super
#     end
#   end
# end
