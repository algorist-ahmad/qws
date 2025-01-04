# qws (Query with Style)

qws is a lightweight wrapper around SQLite designed to simplify querying and reduce friction. It enhances the SQLite CLI with an intuitive interface for efficient day-to-day querying and transactions. The goal is to make querying and working with SQLite as simple, quick, and visually appealing as possible.

Inspired by Taskwarrior's "low-friction" philosophy and syntax, qws provides an easy and efficient way to interact with your SQLite database in the command line.

## How it Works

qws streamlines interaction with SQLite by:

1. Simplifying Queries: Instead of verbose SQL commands, qws allows you to use a simplified syntax that gets translated into valid SQL commands for execution.
2. Formatting with Style: The results are outputted as TSV (Tab-Separated Values) and then enhanced with ANSI control sequences to apply color and style to individual cells.
3. Alignment: The formatted TSV is passed to column -t for automatic alignment, making the results easy to read and understand.

This combination of simplicity, style, and functionality is what makes qws a powerful tool for anyone needing to work with SQLite efficiently and effortlessly.

## Naming

The name qws stands for "query with style" and "query with simplicity", reflecting the tool's core philosophy of providing an easy, efficient, and visually appealing querying experience. With a focus on reducing friction and enhancing usability, qws makes working with SQLite more accessible and enjoyable.
