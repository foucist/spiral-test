def spiral(root)
  x,y = 0,0
  delta = [0, -1]
  width, height = root, root
  result = []

  (1..root**2).each do |i|
    if ((-width/2 < x && x <= width/2) && (-height/2 < y && y <= height/2))
      result << [ x + root-1, y , i ]
    end

    # change direction
    if (x === y || (x < 0 && x === -y) || (x > 0 && x === 1-y))
      delta = [-delta[1], delta[0]]
    end

    x += delta[0];
    y += delta[1];
  end

  # output
  result.map {|x| x[1] }.uniq.sort.reverse.each do |row|
    puts result.select {|x| x[1] == row }.sort_by {|x| x.first }.map {|x| sprintf( "%*d" , (root**2).to_s.size , x.last)}.join(" ")
    puts
  end

end

input = ARGV.shift
value = input.to_i
root = Math.sqrt(value).to_i
if input && (root ** 2 == value)
  spiral(root)
else
  puts "Please provide an integer value for a perfect square"
end
