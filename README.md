# Sweepstake

## How to run the application

```
$ git clone https://github.com/DylanRJ/sweepstake.git
$ bundle install
$ rails db:create
$ rails db:migrate
$ bin/rails console
> competition = Competition.new(name: "Africa Cup of Nations")
> competition.save
> competition2 = Competition.new(name: "Premier League")
> competition2.save
$ exit
$ rails s
Visit http://localhost:3000/ and http://localhost:3000/competitions
```

## Africa Cup of Nations Teams Import

```
$ bin/rails console
```

Action 1: copy, paste and run the following

```
team_arr = ["Algeria",       
 "Burkina Faso",    
 "Cape Verde Islands",     
 "Cameroon",      
 "Comoros",       
 "Ivory Coast",     
 "Egypt",        
 "Equatorial Guinea",  
 "Ethiopia",      
 "Gabon",        
 "Gambia",       
 "Ghana",        
 "Guinea",       
 "Guinea-Bissau",    
 "Malawi",
 "Mali",
 "Mauritania",
 "Morocco",
 "Nigeria",
 "Senegal",
 "Sierra Leone",
 "Sudan",
 "Tunisia",
 "Zimbabwe"]
```

Action 2: Then copy, paste and run the following

```
team_arr.each do |team| 
 Team.create(name: "#{team}", competition_id: 1) 
end
```

Check your 'teams' table in TablePlus, verify you can see the Africa Cup of Nations teams

## Premier League Teams Import

```
$ bin/rails console
```

Action 1: copy, paste and run the following

```
teams_arr2 = [
 "Arsenal",       
 "Aston Villa",    
 "Brentford",     
 "Brighton & Hove Albion",      
 "Burnley",       
 "Chelsea",
 "Crystal Palace",     
 "Everton",        
 "Leeds United",  
 "Leicester City",      
 "Liverpool",        
 "Manchester City",       
 "Manchester United",        
 "Newcastle United",       
 "Norwich City",    
 "Southampton",
 "Tottenham Hotspur",
 "Watford",
 "West Ham United",
 "Wolverhampton Wanderers",
 ]
```

Action 2: Then copy, paste and run the following

```
teams_arr2.each do |team| 
 Team.create(name: "#{team}", competition_id: 2) 
end
```

Check your 'teams' table in TablePlus, verify you can see the Premier League Teams
