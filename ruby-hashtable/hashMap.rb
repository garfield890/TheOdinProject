class HashMap
  attr_reader :load_factor, :capacity
  def initialize(load_factor, capacity)
    @load_factor = load_factor
    @capacity = capacity
    @table = Array.new(@capacity) { [] }
    @size = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key, value)
    hash_val = hash(key) % @capacity
    bucket = @table[hash_val]

    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value 
        return
      end
    end
    bucket << [key, value]
    @size += 1

    if @size.to_f / @capacity > @load_factor
      @capacity = @capacity * 2
      old_table = @table
      @table = Array.new(@capacity) { [] }
      @size = 0
      old_table.each do |bucket|
      bucket.each do |key, value|
        set(key, value)
      end
    end
    end
  end

  def get(key)
    hash_val = hash(key) % @capacity
    bucket = @table[hash_val]

    bucket.each do |pair|
      return pair[1] if pair[0] == key
    end

    nil
  end

  def has?(key)
    hash_val = hash(key) % @capacity
    bucket = @table[hash_val]

    # Check if the key exists in the bucket
    bucket.any? { |pair| pair[0] == key }
  end

  def remove(key)
    hash_val = hash(key) % @capacity
    bucket = @table[hash_val]

    bucket.each_with_index do |pair, index|
      if pair[0] == key
        bucket.delete_at(index)
        return pair[1]
      end
    end

    nil
  end

  def size()
    @size
  end

  def clear()
    @table.each do |bucket|
      bucket = nil
    end
  end

  def keys()
    key_table = []
    @table.each do |bucket|
      bucket.each { |pair| key_table << pair[0] } unless bucket.nil?
    end
    key_table
  end

  def values()
    value_table = []
    @table.each do |bucket|
      bucket.each { |pair| value_table << pair[1] } unless bucket.nil?
    end
    value_table
  end

  def entries()
    entry_table = []
    @table.each do |bucket|
      bucket.each { |pair| entry_table << pair } unless bucket.nil?
    end
    entry_table
  end
end