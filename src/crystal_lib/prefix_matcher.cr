class CrystalLib::PrefixMatcher
  def initialize(@prefixes : Array(String), @remove_prefix : Bool)
  end

  def match(name : String)
    @prefixes.each do |prefix|
      if name.starts_with?(prefix)
        next if name[prefix.size..-1].match(/^\d/)
        name = name[prefix.size..-1] if @remove_prefix
        return name
      end
    end
    nil
  end
end
