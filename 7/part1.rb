#!/usr/bin/ruby

fname = 'inputc'
fname = 'input1'
fname = 'input'

rules = Hash.new()
rulesO = Hash.new()
dataSet=File.readlines(fname)
puts dataSet.length
dataSet.each do |line|
    ruleDef = line.split(/ bags contain /)
    ruleContents=Array.new()
    ruleName = ruleDef[0]
    puts ruleDef[1]
    #puts ruleDef[1].split(/\d+\s+| bags, |\.\r?\n|\./).inspect
    ruleVals=ruleDef[1].split(/ bags[,\.]|,|\r?\n/)
    ruleVals.each do |sr|
        qty=sr.split(" ")[0]
        name=sr.split(/\d+\s+| bag| bags/)[1]
 #       puts "#{qty} #{name}"
        ruleContents.push(name)
        ruleContents.push(qty)
    end
    puts ruleContents.inspect
    rules[ruleName]=ruleContents
    #puts rules[ruleDef[0]]=ruleDef[1].split(/, |\.\r?\n|\./)
    #ruleDef[1].split(/, |\.\r?\n|\./).each do |thing| 
    #    puts thing
    #end
    
end
dataSet.each do |line|
  # my @data = (/[bags contain|,]/,$line);
  if line=~/(.+)\s+bags contain\s+(\d+)\s+(.+) bags*[,.]\s+(\d+)\s+(.+)*bags*/
      #puts "#{$1} contain #{$2} #{$3} and #{$4} #{$5}"
      if $3 == "shiny gold" || $5=="shiny gold"
        puts line
      end
      rulesO[$1]=[$3,$2,$5,$4]
  elsif(line=~/(.+)\s+bags contain\s+(\d+)\s+(.+) bags*[,.]/)
      rulesO[$1]=[$3,$2]
      #puts "#{$1} contain #{$2} #{$3}"
      if $3 == "shiny gold"
        puts line
      end
  elsif(line=~/(.+)\s+bags contain no other bags*[,.]/)
      bags=0
      rulesO[$1]=["none",0]
  end
end

rules.each do |r|
    puts r.inspect 
end
puts"____________"
#puts rulesO.inspect
def bagholds(rules,bag,list)
  rules.each do |k,v|
    if v.include? bag
      list.push(k)
      list=bagholds(rules,k,list)
    else 
    end
  end
  return list
end

baglist=Array.new()
puts bagholds(rules,"shiny gold",baglist).uniq.length
#puts bagholds(rules,"shiny gold",baglist).length