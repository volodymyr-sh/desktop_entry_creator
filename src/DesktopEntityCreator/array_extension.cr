class Array
  def except(*values)
    dup = self.dup

    values.each do |value|
      dup.delete(value)
    end
    dup
  end
end
