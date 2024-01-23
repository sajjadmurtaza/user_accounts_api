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
