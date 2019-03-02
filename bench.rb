require 'bundler'
require './findup'
Bundler.require


%w( S0 S1 S2 S3 S4 ).each do |input|
  Benchmark.driver do |x|
    x.prelude( File.open("findup.rb"){ |f| f.read } )
    %w(
      select_uniq
      uniq_select
      uniq_select_hash
      sort_cons
      group_by_select
    ).each do |name|
      x.report( name, "#{name}(#{input})" )
    end
  end
  i = eval(input)
  puts( "%s: size=%d, ratio=%.0f%%" % [ input, i.size, sort_cons(i).size*100.0 / i.size ] )
  puts "-"*10
end