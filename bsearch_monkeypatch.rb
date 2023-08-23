class Array
  def bsearch(target)
    mid_idx = self.length/2 

    return mid_idx if self[mid_idx] == target
    return nil if self.length == 1 && self[0] != target

    if self[mid_idx] < target
        right_search = self[mid_idx + 1..-1].bsearch(target)
        return nil if right_search == nil
        return mid_idx+1 + right_search
    else
        return self[0...mid_idx].bsearch(target)
    end
  end
end
