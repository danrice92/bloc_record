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
      key = params.keys.first.to_s
      value = params.values.first.to_s
      self.each do |item|
        if item.send(key) == value
          puts item
        end
      end
    end

    def not(params)
      key = params.keys.first.to_s
      value = params.values.first.to_s
      self.each do |item|
        if item.send(key) != value
          puts item
        end
      end
    end

  end
end
