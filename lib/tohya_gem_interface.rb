require 'tohya_gem_interface/dir.rb'
class TohyaGemInterface

  private

  def gem_interface_test
    puts "gem integration successful"
  end

  def check_command(list, cmd)
    if cmd.nil? || !(list.include?(cmd))
      puts "Missing or Invalid Command."
      puts "Legal commands are:"
      list.each { |i| puts "- #{i}" }
      quit
    end
  end

  def quit
    exit
  end
end
