# WillisTowersWatson
*Screening Assignment - C# and SQL Server Problems*
1. Instructions	
2. Unique Email Addresses	
3. Advanced Tic-Tac-Toe	
4. Duplicate Email Addresses	
5. Department Highest Salaries	
6. Camp Site Tracking




## Instructions
Feel free to make any reasonable assumptions (although noting those would be 
beneficial via comments). Please check this code into a public or private 
github repo and send us the link when you’re done. If it’s private, please 
share the repository with email 1, email 2, email 3, and email 4. 
Our hope is that this is simple enough it won’t take too much of your time.


## Unique Email Addresses
Email addresses consist of a local-part and a domain name separated by the @ symbol.  In addition to numbers and lower case letters, the local-part may contain ‘.’s or ‘+’s.  

When a period is placed between characters in the name, the email is delivered to the same address as if the periods were not included. For example an email sent to first.m.last@somewhere.com will be delivered to the same address as firstmlast@somewhere.com.

When a plus is placed in the local name, everything after the plus symbol will be ignored.  This would allow for additional filtering by the recipients.

These rules only apply to the local-part and do not apply to the domain name.  The domain name can consist of lowercase characters and the ‘.’ symbol.

Example: team1@somewhere.com , team.1+bob@somewhere.com and team1+jill+bob@somewhere.com would all go to the same email address.  team2@somewhere.com and team2@some.where.com would go to different addresses,

Given a list of email addresses, return the number of unique email addresses in C#.

The method stub for this method is as follows:

```C#
    public class Solution
    {
        public int NumberOfUniqueEmailAddresses(string[] emails) { }
    }
```
### Answer
Answer is found in the [Solution.cs](https://github.com/jamesd321/WillisTowersWatson/blob/main/Solution.cs).

## Advanced Tic-Tac-Toe
Design a Tic-Tac-Toe game that can be played on an n x n grid by two players.

It can be assumed that all inputs into the game will be valid modes.  After a winning condition is reached, no more moves will be allowed. The winning condition is to place n pieces either horizontally, vertically or diagonally.

The structure of this game will be as follows:
```c#
    public class TicTacToe
    {

        /// <summary>
        /// Created a Tic Tac Tow game board
        /// </summary>
        /// <param name="n">nxn dimension for the game board</param>
        public TicTacToe(int n)
        {

        }

        /// <summary>
        /// Place a piece on the game board
        /// </summary>
        /// <param name="row">row to place a piece</param>
        /// <param name="col">column to place a piece</param>
        /// <param name="player">the player (1 or 2) the piece is for</param>
        /// <returns>0 = no winner, 1 = player 1 won, 2 = player 2 won</returns>
        public int PlacePiece(int row, int col, int player)
        {

        }
    }
```
### Answer
Answer is found in the [TicTacToe.cs](https://github.com/jamesd321/WillisTowersWatson/blob/main/TicTacToe.cs). MS Tests were created in [TicTacToeTests.cs](https://github.com/jamesd321/WillisTowersWatson/blob/main/TicTacToe.cs).

## Duplicate Email Addresses
Write a SQL query that will return duplicate email addresses in an ‘Employee’ Table

Example:
Employee

|employeeId|	email|
|-|-|
|1|	bob.smith@somwhere.com|
|2|	eric.jones@somewhere.com|
|3|	Jill.brown@somewhere.com|
|4|	bob.smith@somwhere.com|

The query for this table would result in
email
bob.smith@somwhere.com

### Answer:
``` SQL
SELECT email
FROM Employee
GROUP BY email 
HAVING COUNT(*) > 1
```

## Department Highest Salaries
Write a query that will find the employees that have the highest salary for their department. If multiple employees share the same salary, the result should include both employees. The result should include the department name, employee name and the salary.

The Employee table stores an employeeId, name, salary and departmentId

The Department table stores a departmentId and a name.

Example:

Employee

| employeeId	| name	| salary	| departmentId | 
| ------------- | ----- | --------- | ------------ | 
|1	|Eric	|85000	|1 |
|2	|Jill	|95000	|1|
|3	|Bob	|76000	|2|
|4	|Emily	|76000	|2|
|5	|Sam	|75000	|2|

Department

|departmentId|	name|
|-|-|
|1|	Sales|
|2|Marketing|

The query would result in:

|Department	|Employee	|Salary|
|-|-|-|
|Sales	|Jill	|95000|
|Marketing	|Bob	|76000|
|Marketing	|Emily	|76000|

### Answer
``` SQL
SELECT D.NAME, E2.name, E2.salary
FROM Employee E
INNER JOIN Department D ON D.departmentId = E.departmentId
INNER JOIN Employee E2 ON E2.departmentId = D.departmentId 
GROUP BY D.NAME, E2.name, E2.salary
HAVING E2.salary = MAX(E.SALARY) 
ORDER BY E2.salary DESC
```

## Camp Site Tracking
Millcreek Canyon management has asked you to create a table to store campsites, 
existing reservations, and available reservation dates for each campsite, 
and they would also like to know the number of visitors to the canyon each day.
*	Please use relational tables to track this information
*	Populate the tables with a small amount of dummy data
    *	The data does not have to be accurate to Millcreek canyon real world specifications
*	Create stored procedure(s) to add or cancel a reservation
    *	Don’t worry about updating information on an existing reservation for this problem
*	Create a view to show available campsite reservation dates
*	Create a function that shows the most popular day to visit the canyon

### Answer
Normally there would be more discovery into the type of data needing to be collected.
The tables are designed to answer the problem listed above plus a few columns that
have been nice in my career. Forexample, created and last modified have always been
great.

Some Assumptions made:
* Campsites can be reserved for more than 1 day. 
A start and end dates are provided to block multiple days; cutting down on 
multiple record entries.
* Cancelling a reservation does not remove the record but marks the record as cancelled.
* Ids are big integers. I have seen 32 bit integers hitting max.
* Metadata column is added incase additional data is needing to be stored
via JSON or another structure.
* Users, logs, and security are not added.

The way of presenting the database changes was not clear. I created SQL files
to be executed on a SQL Server Database.

Order of SQL execution:
1. [Tables.sql](https://github.com/jamesd321/WillisTowersWatson/blob/main/Tables.sql)
2. [Views.sql](https://github.com/jamesd321/WillisTowersWatson/blob/main/Views.sql)
3. [Functions.sql](https://github.com/jamesd321/WillisTowersWatson/blob/main/Functions.sql)
4. [Sprocs.sql](https://github.com/jamesd321/WillisTowersWatson/blob/main/Sprocs.sql)
5. [Data.sql](https://github.com/jamesd321/WillisTowersWatson/blob/main/Data.sql)


