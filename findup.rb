
S0 = Array.new(10){|x| x % 3 }
S1 = Array.new(100){|x| x % 10 }
S2 = Array.new(1000){|x| x % 100 }
S3 = Array.new(10000){|x| x % 1000 }
S4 = Array.new(10000){|x| x % 9000 }

def select_uniq(a)
  a.select { |v| a.count(v) > 1 }.uniq
end

def  uniq_select(a)
  a.uniq.select { |v| a.count(v) > 1 }
end

def uniq_select_hash(a)
  s = a.each.with_object( Hash.new{ |h,k| h[k]=0 } ){ |e,o| o[e]+=1 }
  a.uniq.select{ |v| 1<s[v] }
end

def sort_cons(a)
  a.sort.each_cons(2).with_object([]){ |(x,y),o|
    o.push(x) if x==y && ( o.empty? || o.last!=x )
  }
end

def group_by_select(a)
  a.group_by(&:itself).select { |_, v| v.size > 1 }.keys
end

if __FILE__==$PROGRAM_NAME
  (1..10).each do |len|
    s = Array.new(len){|x| x%10 }
    a = [
      select_uniq(s), 
      uniq_select(s),
      uniq_select_hash(s),
      sort_cons(s),
      group_by_select(s)
    ].map(&:sort)
    p(a) unless a.uniq.size==1
  end
end
