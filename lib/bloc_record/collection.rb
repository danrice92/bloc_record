module BlocRecord
  class Collection < Array
    def update_all(updates)
      ids = self.map(&:id)
      self.any? ? self.first.class.update(ids, updates) : false
    end

    def take(num=1)
      loop_point = 0
      while loop_point < num
        puts self.sample
        loop_point += 1
      end
    end

    def where(params)
      results = BlocRecord::Collection.new
      params.each do |k, v|
        results << self.select { |item| item if item.send(k) == v }
      end
      results
    end

    def not(params)
      results = BlocRecord::Collection.new
      params.each do |k, v|
        results << self.select { |item| item if item.send(k) != v }
      end
      results
    end

  end
end
