require_relative 'models/path'

input_array = ARGV

input_array[2] = input_array[2] || 50
input_array[3] = input_array[3] || "AIzaSyBYlpDB2j37YVRgM-qYpzr9q7AvjXJ4oYY"
Path.new(input_array[0], input_array[1], input_array[2], input_array[3]).print_path