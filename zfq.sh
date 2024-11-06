#!/bin/bash

# Directory where registered databases are stored
DB_DIR="$HOME/.zfq/databases"

# Simulate list of tables in a connected database
SIMULATED_TABLES=("users" "products" "orders" "customers")

# Function to display only relevant environment variables for ZFQ
show_zfq_env_vars() {
    echo "ZFQ Environment Variables:"
    echo "--------------------------"
    echo "ZFQ_DB_PATH=$ZFQ_DB_PATH"
    echo "ZFQ_DB_CONNECTED=$ZFQ_DB_CONNECTED"
    echo "ZFQ_LOG_LEVEL=$ZFQ_LOG_LEVEL"
    echo "--------------------------"
}

# Simulate connecting to a database
simulate_db_connection() {
    if [ -z "$ZFQ_DB_PATH" ]; then
        echo "Error: No database connected or invalid path."
        return 1
    fi
    export ZFQ_DB_CONNECTED=true
    echo "Connected to database: $ZFQ_DB_PATH"
    return 0
}

# Create DB directory if it doesn't exist
create_db_dir() {
    if [ ! -d "$DB_DIR" ]; then
        mkdir -p "$DB_DIR"
        echo "Created database directory: $DB_DIR"
    fi
}

# List tables in the connected database
list_tables() {
    if [ "$ZFQ_DB_CONNECTED" != "true" ]; then
        echo "No database connected. Please connect to a database first."
        return 1
    fi
    
    echo "Listing tables in the connected database:"
    for table in "${SIMULATED_TABLES[@]}"; do
        echo "  $table"
    done
}

# List registered databases
list_databases() {
    create_db_dir  # Ensure the directory exists
    local db_files=("$DB_DIR"/*.db)

    if [ ${#db_files[@]} -gt 0 ]; then
        echo "Registered databases:"
        for db in "${db_files[@]}"; do
            echo "  $(basename "$db")"
        done
    else
        echo "No databases registered yet."
    fi
}

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    echo "Zero Friction Query (ZFQ) - A simple, efficient wrapper for SQLite."
    echo ""
    echo "Usage:"
    echo "  zfq query <sql_query>        Run an SQL query"
    echo "  zfq set <variable=value>     Set an environment variable for configuration"
    echo "  zfq connect                 Simulate connecting to a database"
    echo "  zfq -l                      List all registered databases or tables in the connected database"
    echo "  zfq help                    Show this help message"
    echo "  zfq version                 Show version information"
    exit 0
fi

# If '-l' is used, list all registered databases or list tables in the connected database
if [ "$1" == "-l" ]; then
    if [ "$ZFQ_DB_CONNECTED" == "true" ]; then
        list_tables
    else
        list_databases
    fi
    exit 0
fi

# If 'set' command is used to modify environment variables
if [ "$1" == "set" ]; then
    if [ $# -ne 2 ]; then
        echo "Error: Missing variable=value argument for 'set'."
        exit 1
    fi

    # Set the environment variable from argument (e.g., ZFQ_DB_PATH=/path/to/db)
    export "$2"
    echo "Environment variable '$2' set."

    # Show updated environment variables for debugging
    show_zfq_env_vars
    exit 0
fi

# If 'query' command is used, just show the current environment (no actual SQL processing in this prototype)
if [ "$1" == "query" ]; then
    if [ $# -ne 2 ]; then
        echo "Error: Missing SQL query argument for 'query'."
        exit 1
    fi

    # Simulate the database query execution
    echo "Simulating query execution: $2"
    echo "No actual database interaction in this prototype."

    # Show environment variables after running query
    show_zfq_env_vars
    exit 0
fi

# If 'connect' command is used, simulate connecting to a database
if [ "$1" == "connect" ]; then
    echo "Attempting to connect to the database..."
    simulate_db_connection
    show_zfq_env_vars
    exit 0
fi

# If 'help' or unrecognized command is used, show help message
if [ "$1" == "help" ]; then
    echo "Zero Friction Query (ZFQ) - A simple, efficient wrapper for SQLite."
    echo ""
    echo "Usage:"
    echo "  zfq query <sql_query>        Run an SQL query"
    echo "  zfq set <variable=value>     Set an environment variable for configuration"
    echo "  zfq connect                 Simulate connecting to a database"
    echo "  zfq -l                      List all registered databases or tables in the connected database"
    echo "  zfq help                    Show this help message"
    echo "  zfq version                 Show version information"
    exit 0
fi

echo "Unknown command. Use 'zfq help' for usage information."
exit 1
