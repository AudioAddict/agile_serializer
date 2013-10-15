class Hash
  def deep_merge_all(other_hash)
    new_hash = dup
    other_hash.each_pair do |k,v|
      tv = new_hash[k]
      new_hash[k] = 
      if tv.is_a?(Hash) && v.is_a?(Hash)
        tv.deep_merge_all(v)
      elsif tv.is_a?(Array) && v.is_a?(Array)
        (tv + v).uniq
      else
        v
      end
    end
    new_hash
  end
end