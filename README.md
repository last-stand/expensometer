<img src="https://i.imgur.com/2scPk5V.png" width="60" height="60" />

# expensometer
Java based expense tracker app.

### Build the app

- Run
    ```
        $ gradle clean build
    ```

### Start the server

- After building the app, run
    ```
        $ gradle bootRun

        OR

        $ java -jar build/libs/expensometer-1.0-SNAPSHOT.jar
    ```
- Now hit [http://localhost:8080/hello](http://localhost:8080/hello) on your browser or simply make a _curl request_
    ```
        $ curl http://localhost:8080/hello
    ```
