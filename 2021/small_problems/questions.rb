integer.to_s.chars.map(&:to_i).reduce(:+)
# why does #map require block while reduce can take symbol with or without &?