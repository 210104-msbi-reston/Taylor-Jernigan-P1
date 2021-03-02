# Taylor-Jernigan-P1

## Project Description

The goal of this project was to design a SQL Database using Microsoft SQL Server Management Studio that correlates with the distribution chain of a mock version of Apple Inc. This database would include normalized tables to represent the flow of production from production houses on the country and continent level, all the way down to the individual customer purchasing an item.

## Technologies Used

* SQL
* T-SQL
* SSIS
* Microsoft SQL Server 2017
* Microsoft Visual Studio (SSDT) 2017
* Microsoft Excel 365

## Features

* Generate an individual product with a unique ID.
* Generate multiple products each with a unique ID.
* Create a trigger balanced logging system to record the transition of products.
* Produce a full inventory stock using stored procedures to check current quantities of items and replace them down the chain if they are low.
* Log details for transactions at each individual distribution level.
* Access information on an item's purchase and distribution history through the use of views.

To-do list:
* Create a return method for product to be distrubted back up the chain all the way to the production house.
* Generate views for viewing specific prices at particular locations.
* Generate views mapping customers to specific locations.
* Clean up stored procedures and streamline the process.

## Getting Started
   
* Git clone the following repository: [Taylor-Jernigan-P1](https://github.com/210104-msbi-reston/Taylor-Jernigan-P1).
* Restore the database using the given .bak in the cloned repository.
* For an alternative method, run the AppleIncDatabase.sql query script located in the cloned repository to generate the database.

## Usage

Demo.sql provides a look at stored procedures, triggers, and functions that can be used within this database, as well as their specific uses.

## License

* [SQL Server Management Studio](https://docs.microsoft.com/en-us/legal/sql/sql-server-management-studio-license-terms)
* [Microsoft SSDT](https://docs.microsoft.com/en-us/legal/sql/sql-server-data-tools-license-terms)
* [Microsoft 365](https://www.microsoft.com/en-us/Useterms/Retail/OfficeinMicrosoft365/Personal/Useterms_Retail_OfficeinMicrosoft365_Personal_English.htm)
