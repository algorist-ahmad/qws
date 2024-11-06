# zfq (Zero Friction Query)

ZFQ is a lightweight wrapper around SQLite designed to simplify querying and reduce friction. Its goal is to provide a intuitive interface for managing and querying data with minimal effort. Built for more efficient day-to-day querying and transactions in the command line, making it ideal for quick, repetitive tasks.

Inspired by Taskwarrior's "low-friction" philosophy and syntax.

## Naming

I created this tool as a simple and efficient wrapper around SQLite, inspired by Taskwarrior’s "low-friction"
philosophy. The goal was to reduce complexity and make querying as smooth and effortless as possible.

The name needed to be concise, intuitive, and reflect the core purpose of the tool. I wanted it to convey
**low friction**, **efficiency**, and **simplicity**. After experimenting with various options, I settled on
**Zero Friction Query (ZFQ)**. This name is **descriptive**, **easy to remember**, and aligns perfectly with
the tool’s aim of providing a frictionless querying experience.

**ZFQ** was chosen for its clarity and simplicity, reflecting the tool’s core philosophy and ensuring that it
directly communicates its purpose.

------------

ZFQ Simulation Workflow

This document outlines the entire interactive workflow simulation for ZFQ (Zero Friction Query). The simulation demonstrates how a user interacts with the tool, from connecting to a database to executing queries, adjusting table columns, and applying various filters, sorters, and limits—all while maintaining a smooth and efficient user experience.
Workflow Overview

The ZFQ tool is designed to streamline SQLite querying by removing the complexities typically associated with traditional command-line tools. The simulation takes the user through several stages of interacting with a database, performing actions like:

    Connecting to a database
    Listing tables
    Selecting a table
    Filtering and sorting data
    Adjusting column widths
    Limiting results
    Displaying data interactively

1. Database Connection

    When ZFQ is first executed, it checks if a database is connected.
    If no database is connected, the message No database connected. is shown.

2. Listing Databases (zfq -l)

    When the user runs zfq -l, ZFQ lists all registered databases.
    If a database is selected, zfq -l lists all available tables within the currently connected database.

3. Selecting a Table

    The user selects a table by typing zfq SELECT <table_name>.
    From that point on, every query is automatically prepended with the SELECT <columns> FROM <table> statement.
    This feature allows the user to interact with the database without needing to specify the table each time.

4. Filtering Columns

    The user can filter which columns to view by specifying column names in the zfq command.
    For example, zfq -c name,email will display only the name and email columns.

5. Sorting Data

    The user can sort the data by specific columns using the zfq -s <column> command.
    Sorting is performed in ascending order by default, with the option for descending sorting using -sd.

6. Limiting Results

    The user can limit the number of rows displayed using the zfq -l <limit> command.
    This helps the user focus on a subset of the data, especially when dealing with large datasets.

7. Adjusting Column Width

    The user can adjust the width of columns by specifying the width with the -w <column>:<width> option.
    Adjusting the column width allows for a more readable output, especially when working with large datasets that include lengthy text.

8. Interactive Filtering and Sorting

    Users can interactively filter and sort the table by specifying columns or using predefined arguments such as -f for filtering or -s for sorting.
    The table is automatically updated after each action, making the user’s workflow efficient and responsive.

9. Output with Dramatic Effect

    To enhance the user experience, a sleep timer (sleep 0.4) is added between table rows to give a smooth and dramatic effect during output, making the interaction feel more natural.

10. User Command History and Feedback

    The user’s command input is shown in the terminal along with the respective output, providing full transparency and a clear understanding of the executed commands.