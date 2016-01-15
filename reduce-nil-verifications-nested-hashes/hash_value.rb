#
# Check if a hash constains the path of keys.
#
# Example:
# h = { a: { b: { c: 1 }}}
#
# hash_value h, :a, :b              # { c: 1 }
# hash_value h, :a, :b, :c          # 1
# hash_value h, :a, :b, :d          # nil
# hash_value h, :a, :d              # nil
# hash_value h, :a, :d, :c          # nil
# hash_value h, :a, :b, :c, :d      # nil
#
# == Parameters:
# hash::
#   Hash to check.
# keys::
#   Array with the sequence of keys to get value
#
# == Returns:
# Value of the key in the hash or nil
#
def hash_value(hash, *keys)
  if hash[keys.first] && keys.size == 1
    return hash[keys.first]
  elsif hash[keys.first] && hash[keys.first].is_a?(Hash)
    hash_value(hash[keys.first], *keys[1..keys.size-1])
  else
    return nil
  end
end
