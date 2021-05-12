//Getting all pitches submitted based by province
SELECT Pitch.ManagementLocation, count(*) from Pitch GROUP By Pitch.ManagementLocation 

//Check where the most industries
SELECT Pitch.Industry, count(*) from Pitch GROUP By Pitch.Industry 

//check most success based on industry
SELECT Pitch.Industry, count(*) from Pitch WHERE isSuccess=1 GROUP By Pitch.Industry 

//most success by region
SELECT Pitch.ManagementLocation, count(*) from Pitch WHERE isSuccess=1 GROUP By Pitch.ManagementLocation 


// business received funding
->by location
SELECT Pitch.ManagementLocation, count(*) from Pitch,BidEquity WHERE BidEquity.isAccepted=1 AND BidEquity.PitchID = Pitch.PitchID GROUP By Pitch.ManagementLocation 
-> by industries
SELECT Pitch.Industry, count(*) from Pitch,BidEquity WHERE BidEquity.isAccepted=1 AND BidEquity.PitchID = Pitch.PitchID GROUP By Pitch.Industry 

//check where most users are located

//check the age group

