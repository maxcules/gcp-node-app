## MongoDB Setup

1. copy and run `mongo_init.sh` on each VM
2. use `mongosh` inside VM named `mongo-1` to enter DB
3. once inside the DB, run the code:
```
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "10.10.0.10:27017", priority: 2 },
    { _id: 1, host: "10.10.0.11:27017", priority: 1 },
    { _id: 2, host: "10.10.0.12:27017", arbiterOnly: true }
  ]
})
```
4. check status with `rs.status()`
