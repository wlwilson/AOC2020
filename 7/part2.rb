#!/usr/bin/ruby

fname = 'inputc'
fname = 'input'
fname = 'input1'

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

#rules.each do |r|
#    puts r.inspect 
#end
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
  rules.each do |k,v|
    puts "#{k} #{v}"
    if v.include? 0
      #return 1
    else
    end
  end
  puts bag
  return rules[bag]
end

#BH=bagholds(rules,"shiny gold",baglist)
#puts "---end---"
#puts BH.uniq.length
#puts BH.uniq.inspect
#puts bagholds(rules,"shiny gold",baglist).length
puts bagContains(rules,"shiny gold")