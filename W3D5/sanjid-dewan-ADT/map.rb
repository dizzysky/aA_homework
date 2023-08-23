class Map 

    def initialize
        @map = []
    end


    def set(key,value)
        @map.each do |pair| 
            if pair[0] == key
                pair[1] = value
                return pair
            end
        end
        @map << [key,value]
        return  [key,value]
    end

    def get(key)
        
        @map.each do |pair| 
            if pair[0] == key 
                return pair[1]
            end
        end
        return false
    end

    def delete(key)
        
        @map.each do |pair| 
            if pair[0] == key
                @map.delete(pair)
                return true
            end
        end
        return false
    end

    def show 
        p @map
    end

end