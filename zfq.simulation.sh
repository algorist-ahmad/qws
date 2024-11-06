#!/bin/bash

# Simulated data for users table
SIMULATED_USER_DATA=(
    "id|name|email|age|location"
    "1|John Doe|john@example.com|29|New York"
    "2|Jane Smith|jane@example.com|34|California"
    "3|Alice Johnson|alice@example.com|27|Texas"
    "4|Bob Brown|bob@example.com|45|Florida"
    "5|Charlie White|charlie@example.com|30|Nevada"
    "6|David Green|david@example.com|33|Colorado"
)

# Page size for pagination
PAGE_SIZE=3
PAGE=1

# Function to simulate filtering by a column with a regex search
filter_data() {
    local filter="$1"
    echo "Filtering by: $filter"
    sleep 0.4
    for row in "${SIMULATED_USER_DATA[@]}"; do
        if [[ "$row" =~ $filter ]]; then
            IFS='|' read -r id name email age location <<< "$row"
            echo "$id  | $name       | $email            | $age | $location"
            sleep 0.4
        fi
    done
}

# Function to simulate sorting by multiple columns
sort_data() {
    local sort_order="$1"
    echo "Sorting by: $sort_order"
    sleep 0.4
    sorted_data=($(for row in "${SIMULATED_USER_DATA[@]}"; do echo "$row"; done | sort -t'|' -k"$sort_order"))
    for row in "${sorted_data[@]}"; do
        IFS='|' read -r id name email age location <<< "$row"
        echo "$id  | $name       | $email            | $age | $location"
        sleep 0.4
    done
}

# Function to limit number of rows
limit_data() {
    local limit="$1"
    echo "Limiting to: $limit rows"
    sleep 0.4
    count=0
    for row in "${SIMULATED_USER_DATA[@]}"; do
        if [ "$count" -ge "$limit" ]; then
            break
        fi
        IFS='|' read -r id name email age location <<< "$row"
        echo "$id  | $name       | $email            | $age | $location"
        sleep 0.4
        ((count++))
    done
}

# Function to paginate results
paginate_data() {
    local page="$1"
    local offset=$(( (page - 1) * PAGE_SIZE))
    echo "Displaying page $page:"
    sleep 0.4
    count=0
    for row in "${SIMULATED_USER_DATA[@]}"; do
        if [ "$count" -ge "$offset" ] && [ "$count" -lt $((offset + PAGE_SIZE)) ]; then
            IFS='|' read -r id name email age location <<< "$row"
            echo "$id  | $name       | $email            | $age | $location"
            sleep 0.4
        fi
        ((count++))
    done
}

# Function to adjust column width
adjust_column_width() {
    local width="$1"
    echo "Adjusting column width to: $width"
    sleep 0.4
    for row in "${SIMULATED_USER_DATA[@]}"; do
        IFS='|' read -r id name email age location <<< "$row"
        printf "%-${width}s| %-${width}s| %-${width}s| %-${width}s| %-${width}s\n" "$id" "$name" "$email" "$age" "$location"
        sleep 0.4
    done
}

# Function to show selected columns
show_selected_columns() {
    local columns="$1"
    IFS=',' read -r -a selected_columns <<< "$columns"
    echo "Showing columns: ${selected_columns[*]}"
    sleep 0.4
    for row in "${SIMULATED_USER_DATA[@]}"; do
        IFS='|' read -r id name email age location <<< "$row"
        output=""
        for column in "${selected_columns[@]}"; do
            case $column in
                "id") output="$output$id ";;
                "name") output="$output$name ";;
                "email") output="$output$email ";;
                "age") output="$output$age ";;
                "location") output="$output$location ";;
            esac
        done
        echo "$output"
        sleep 0.4
    done
}

# Function to update a row (simulated)
update_row() {
    local id="$1"
    local new_name="$2"
    local new_email="$3"
    echo "Updating row with ID $id"
    sleep 0.4
    for i in "${!SIMULATED_USER_DATA[@]}"; do
        if [[ "${SIMULATED_USER_DATA[$i]}" =~ ^$id ]]; then
            SIMULATED_USER_DATA[$i]="$id|$new_name|$new_email|$(echo ${SIMULATED_USER_DATA[$i]} | cut -d'|' -f4-)"
            echo "Row updated: ${SIMULATED_USER_DATA[$i]}"
            sleep 0.4
        fi
    done
}

# Simulate user typing commands interactively
simulate_interactive_session() {
    # User connects to database
    echo "$ zfq"
    echo "Connected to database: /path/to/database.db"
    sleep 0.4

    # Simulate user selecting the 'users' table
    echo "$ zfq -s users"
    export ZFQ_SELECTED_TABLE="users"
    echo "Selected table: $ZFQ_SELECTED_TABLE"
    sleep 0.4

    # Show all rows
    echo "$ zfq"
    echo "Displaying rows from '$ZFQ_SELECTED_TABLE' table:"
    sleep 0.4
    for row in "${SIMULATED_USER_DATA[@]}"; do
        IFS='|' read -r id name email age location <<< "$row"
        echo "$id  | $name       | $email            | $age | $location"
        sleep 0.4
    done
    echo ""
    sleep 0.4

    # Simulate user filtering by age > 30
    echo "$ zfq -f '30'"
    filter_data "30"
    echo ""

    # Simulate user sorting by name (ascending)
    echo "$ zfq -s 2"
    sort_data 2
    echo ""

    # Simulate user limiting to 2 rows
    echo "$ zfq -l 2"
    limit_data 2
    echo ""

    # Simulate user selecting specific columns
    echo "$ zfq -c id,name"
    show_selected_columns "id,name"
    echo ""

    # Simulate user paginating to page 2
    echo "$ zfq -p 2"
    paginate_data 2
    echo ""

    # Simulate user adjusting column width to 20
    echo "$ zfq -w 20"
    adjust_column_width 20
    echo ""

    # Simulate user updating a row (ID 1)
    echo "$ zfq -u 1 'Johnathan Doe' 'johnathan@example.com'"
    update_row 1 "Johnathan Doe" "johnathan@example.com"
    echo ""
    
    # Show the updated row
    echo "$ zfq"
    echo "Displaying updated rows from '$ZFQ_SELECTED_TABLE' table:"
    sleep 0.4
    for row in "${SIMULATED_USER_DATA[@]}"; do
        IFS='|' read -r id name email age location <<< "$row"
        echo "$id  | $name       | $email            | $age | $location"
        sleep 0.4
    done
    echo ""
}

# Start the interactive simulation
simulate_interactive_session
