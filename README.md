# Accounts API Client

https://www.loom.com/share/a3ac0037d8fa4d1fa31f2a9373b06108

This Ruby application serves as a client for fetching user and account information from the  Accounts API.

## How to Run

ruby: 3.0.0

To run the Rails server, use the following command:

```bash
    rails server
```

## Using Postman

1. Open Postman and create a new request.

2. Set the request type to `GET``.

3. Enter the following URL:

    ```env
    http://localhost:3000/api/v1/users/1
    ```
4. Send the request.

5. Expected Outcome:

```bash
    {
    "name": "Alice",
    "account_list": [
        {
            "name": "A銀行",
            "balance": 20000
        },
        {
            "name": "C信用金庫",
            "balance": 120000
        },
        {
            "name": "E銀行",
            "balance": 5000
        }
    ]
}
```


## Services

### 1. `UserAccountService`

- **Description:** This service class is responsible for orchestrating the retrieval of user account information. It utilizes other service classes (`FetchUserData`, `FetchAccountsData`, and `FetchBalances`) to gather the necessary data and constructs a formatted response.

### 2. `FetchUserData`

- **Description:** This service class is dedicated to fetching user-specific data from the Sample Accounts API. It communicates with the API endpoint related to user information and extracts relevant details such as user name and account IDs.

### 3. `FetchAccountsData`

- **Description:** This service class focuses on fetching account data associated with a specific user. It communicates with the API endpoint responsible for retrieving account information and stores the data for further processing.

### 4. `FetchBalances`

- **Description:** This service class handles the retrieval of account balances. It takes the accounts data obtained from the `FetchAccountsData` service and makes additional API requests to gather balance information for each account.

### 5. `BaseApiFetcher`

- **Description:** This is a base class for fetching data from a remote API. It encapsulates common functionality for making API requests, handling responses, and logging errors. Subclasses, such as `FetchUserData`, `FetchAccountsData`, and `FetchBalances`, extend this base class to customize their specific API interactions.
