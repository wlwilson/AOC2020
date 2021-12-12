#!/usr/bin/ruby

fname = 'inputc'
fname = 'input1'
fname = 'input2'
fname = 'input'

rules = Hash.new()
rulesO = Hash.new()
dataSet=File.readlines(fname)
#puts dataSet.length
dataSet.each do |line|
    ruleDef = line.split(/ bags contain /)
    ruleContents=Array.new()
    ruleName = ruleDef[0]
    #puts ruleDef[1].split(/\d+\s+| bags, |\.\r?\n|\./).inspect
    ruleVals=ruleDef[1].split(/ bags[,\.]|,|\r?\n/)
    ruleVals.each do |sr|
        qty=sr.split(" ")[0]
        name=sr.split(/\d+\s+| bag| bags/)[1]
 #       puts "#{qty} #{name}"
        ruleContents.push(name)
        if qty=="no"
          qty=0
        end
        ruleContents.push(qty)
    end
    rules[ruleName]=ruleContents
    #puts rules[ruleDef[0]]=ruleDef[1].split(/, |\.\r?\n|\./)
    #ruleDef[1].split(/, |\.\r?\n|\./).each do |thing| 
    #    puts thing
    #end
    
end

rules.each do |r|
    puts r.inspect 
end
puts"____________"
#puts rulesO.inspect
def bagholds(rules,bag,list)
  rules.each do |k,v|
    if v.include? bag
      puts v.inspect
      puts k
      puts v[v.index(k).to_i+1]
      list.push(k)
      list=bagholds(rules,k,list)
    else 
    end
  end
  return list
end

def bagContains(rules,bag)
  puts "checking for bag #{bag}"
  #rules.each do |k,v|
  k=bag
  v=rules[k]
    puts "#{k} #{v}"
    if v.include? 0
      #puts "Found zero: #{k} #{v}"
      sum=0
      #puts "base case returns #{sum}"
      return sum
    else
      #puts "Found desired bag #{k}, which contains #{v}"
      #puts v.length
      if sum == nil; sum=0; end
      for i in 0..((v.length/2)-1)
        count=v[(i*2+1)];type=v[(i*2)]
        #puts "i equals #{i},adding #{count} of #{type}"
        sum=sum+count.to_i+count.to_i*(bagContains(rules,type).to_i)
      end
      return sum
    end
  #end
  #puts bag
  #return rules[bag]
end

#BH=bagholds(rules,"shiny gold",baglist)
#puts "---end---"
#puts BH.uniq.length
#puts BH.uniq.inspect
#puts bagholds(rules,"shiny gold",baglist).length
puts bagContains(rules,"shiny gold")
#puts bagContains(rules,"faded blue")
#puts bagContains(rules,"dark olive")
#puts bagContains(rules,"poopy purple")
#puts bagContains(rules,"muted yellow")
