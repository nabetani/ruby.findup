require 'bundler'
Bundler.require


%w( S0 S1 S2 ).each do |input|
  Benchmark.driver do |x|
    x.prelude( File.open("findup.rb"){ |f| f.read } )
    %w(
      select_uniq
      uniq_select
      uniq_select_hash
      sort_cons
    ).each do |name|
      x.report( name, "#{name}(#{input})" )
    end
  end
end