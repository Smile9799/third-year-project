# USE CASES AND DESCRIPTIONS

## <u> REGISTRATION SUBSYTEM </u>

![](images/usecases/Page1.svg)

#### Use Case: <u> Register </u>
<br>
Input: User first and last name, Id number, Email address, and password
<br>
Output: Redirect to log in
<br>
1. Add a new user
<br>
2. The user fills in the required fields
<br>
3. The system validates the entered details
<br>
4. The system stores the user details
<br>
<u> Extensions </u>
<br>
1a.Choose type of user
<br>
 1. Innovator will choose to register as innovator
<br>
 2. Investor will choose to register as investor
<br>
 3. Reviewer will choose to register as reviewer
<br>
3a.ID number already exists in the database
<br>
 1. The system notifies the user of already existing iD
<br>
 2. The user can either change the ID or Log in
<br>
3b.Password does not meet minmum complex requirements
<br>
 1. The system notifies the user 
<br>
 2. The user can either fix password or cancel
<br>
3c.Password do not match
<br>
  1. The system notifies the user that password field and confirm password filed do not match
   <br>
  2. The user can fix the password or cancel
<br>

#### Use Case: <u> Log in </u>
<br>
Input: Email address and password
<br>
Output: Redirect to Home page
<br>
1. The user enters the email and password
<br>
2. The system marks the user as logged in and create a session
<br>

<u> Extensions </u>
<br>
1a.Invalid email or password
<br>
 1. The system notifies the user that email and/or password do not match
<br>
 2. The user can fix the log in details or cancel
<br>

## <u> EXTERNAL REVIEW SUBSYSTEM </u>

![](images/usecases/Page2.svg)

#### Use Case: <u> Forwards the application to the investor </u>
<br>
Input: 
<br>
Output: The reviewed application
<br>
1. The reviewer forwards the application to the investor
<br>
2. The system confirms the activity that occured

<br>

#### Use case: <u> Make decision on the forwarded application </u>
<br>
Input: Approved application by reviewer
<br>
Output: Decision on the application 
<br>
1. The investor reviews the application by themselves
<br>
2. The investor either accepts or reject the application based on personal preference 
<br>

#### Use Case: <u> Notify reviewer of verdict </u>
<br>
Input: Decision
<br>
Output: Message to the reviewer
<br>
1. The Investor sends a message to the reviewer to alert of the decision taken
<br>
2. The system confirms the activity that occured

## <u> INTERVIEW SETUP SUBSYSTEM </u>

![](images/usecases/Page3.svg)

<br>

#### Use case: <u> Alerts the reviewer of the interview details </u>
<br>
Input: Date and time
<br>
Output: alerts the reviewer of Interview details
<br>
1. The investor send interview details to the reviewer
<br>
2. The system confirms the details have been sent
<br>

#### Use case: <u> Alerts the innovator of interview details </u>
<br>
Input: interview details from investor 
<br>
Output: alert the innovator of interview details
<br>
1. The reviewer send the interview details to the innovator
<br>
2. The system confirms the details have been sent
<br>

#### Use case: <u> Make decision on interview </u>
<br>
Input: Interview details from reviewer
<br>
Output: Decision taken
<br>
1. The innovator can either accepts or rejects the interview
<br>
2. The system confirms on the decision taken and send feedback to the reviewer
<br>

## <u> PRUNING SYSTEM </u>

![](images/usecases/Page6.svg)

#### Use Case: <u> Add a pitch </u>
<br>
Input: Pitch tittle, management location, industry type, stage of project, Investor role, amount raising, minimum amount from investor, short summary, the bussiness, the market, obejects and files to be uploaded (Bussiness plan, Financials, Executive summary and any other additional documents)
<br>
Output: Confirmation of submitted application
<br>
1. The user fills in the required details
<br>
2. The user checks for plagirism
<br>
3. The user submits the application
<br>
Extensions
<br>
1a.Missing mandotaory fields
<br>
 1. The system notifies the user of missing fields
<br>
 2. The user can fill in the missed fields or cancel
<br>
2a.Plagirism above maximum allowed percentage of plagirism
<br>
 1. The system notifies the user
<br>
 2. The user can either fix the issue or abort the application
<br>

#### Use Case: <u> Review Application </u>
<br>
Input: Application from the user
<br>
Output: Decision taken
<br>
1. The system compares the user application with the investor requirements
<br>
2. The System accepts the application if the requirements are met or reject if they are not met
<br>

#### Use case: <u> Notify Innovator </u>
<br>
Input: Decision from the system
<br>
Output: Message to the Innovator
<br>
1. The reviewer notifies the innovator how the first stage went
<br>
2. The system confirms the activity that occured

## <u> NAVIGATION SUBSYSTEM </u>

  ![](images/usecases/Page5.svg)


#### Use case: <u> Select Address </u>
<br>
Input: Interview location address
<br>
Output: 
<br>
1. The investor save the address location
<br>
2. The system confirms the saved address
<br>

#### Use case: <u> Notify MEEK system </u>
Input: The saved location address
<br>
Output: 
<br>
1. The Investor notifies the MEEK system 
<br>

#### Use case: <u> Receive meeting location </u>
<br>
input: 
<br>
output: address location saved by the Investor
<br>
1. The innovator retrives the saved address
<br>

#### Use case: <u> Get direction </u>
<br>
Input: address location 
<br>
Output: the route to take to location
<br>
1. The innovator enters current address
<br>
2. The system finds route and displays     
<br>

## <u> INTERNAL REVIEW SUBSYSTEM </u>

![](images/usecases/Page4.svg)

#### Use case: <u> Make decision on application </u>
<br>
Input: Application that passed the first stage
<br>
Output: Decision on the application
<br>
1. The reviewer reviewes the application
<br>
2. The reviewer accepts the application based on the guidelines provided on by the investor or rejects the application
<br>

#### Use case: <u> Notify the innovator of the results </u>
<br>
Input: Decision on the application
<br>
Output: Message to innovator 
<br>
1. Notifies the innovator of the decision taken
<br>
2. The system confirms the activity that occured


Use case: Select Address
<br>
Input: Interview location address
<br>
Output: 
<br>
1. The investor save the address location
<br>
2. The system confirms the saved address
<br>
Use case: Notify MEEK system
<br>
Input: The saved location address
<br>
Output: 
<br>
1. The Investor notifies the MEEK system 
<br>
Use case: receive meeting location
<br>
input: 
<br>
output: address location saved by the Investor
<br>
1. the innovator retrives the saved address
<br>
Use case: Get direction
<br>
Input: address location 
<br>
Output: the route to take to location
<br>
1. The innovator enters current address
<br>
2. The system finds route and displays

Use Case: Add a pitch
<br>
Input: Pitch tittle, management location, industry type, stage of project, Investor role, amount raising, minimum amount from investor, short summary, the bussiness, the market, obejects and files to be uploaded (Bussiness plan, Financials, Executive summary and any other additional documents)
<br>
Output: Confirmation of submitted application
<br>
1. The user fills in the required details
<br>
2. The user checks for plagirism
<br>
3. The user submits the application
<br>
Extensions
<br>
1a. Missing mandotaory fields
<br>
1. The system notifies the user of missing fields
<br>
2. The user can fill in the missed fields or cancel
<br>
2a. Plagirism above maximum allowed percentage of plagirism
<br>
1. The system notifies the user
<br>
2. The user can either fix the issue or abort the application
<br>

Use Case: Review Application
<br>
Input: Application from the user
<br>
Output: Decision taken
<br>
1. The system compares the user application with the investor requirements
<br>
2. The System accepts the application if the requirements are met or reject if they are not met
<br>

Use case: Notify Innovator
<br>
Input: Decision from the system
<br>
Output: Message to the Innovator
<br>
1. The reviewer notifies the innovator how the first stage went
<br>
2. The system confirms the activity that occured