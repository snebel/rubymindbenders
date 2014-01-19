class Array
	# called on a square 2D matrix
  def spiral
  	return [] if self.empty? || self.first.empty?
  	# first row + last column + last row.reverse + first column.reverse

		border = self.shift + self.map { |row| row.pop }
		border += self.pop.reverse 
		border += self.map { |row| row.shift }.reverse
		#print border
		# border = []
		# border += self.map { |row| row.pop } #last column
		# border += self.pop.reverse # unless !self.pop # reverse last row
		# border += self.map { |row| row.shift }.reverse #reverse first column
		border + self.spiral
  end
end



# # print spiral([[1,2], [4,3]])
# matrix = 	[
# 		[1, 2, 3, 4],
# 		[5, 6, 7, 8],
# 		[9, 0, 1, 2],
# 		[3, 4, 5, 6]
# 	]

# print matrix.spiral
# # # # => 1, 2, 3, 4, 8, 2, 6, 5, 4, 3, 9, 5, 6, 7, 1, 0
# puts
# matrix2 = [[1, 2, 3],
#            [4, 5, 6],
#            [7, 8, 9]]
# print matrix2.spiral
# # => 1,2,3,6,9,8,7,4,5

