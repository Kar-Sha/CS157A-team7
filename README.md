# CS157A-Team7
Group Project

### Database Setup
1. Import and run `PharmaPickupSQL.sql` in your MySQL server.

### Context Setup
1. Create a new file called `context.xml` in the WebContent/META-INF folder.

2. Copy the code below into `context.xml` 
```
<Context path="/pharma">
    <Resource name="jdbc/pharma" auth="Container"
        driverClassName="com.mysql.jdbc.Driver"
        url="jdbc:mysql://127.0.0.1:3306/pharmapickup"
        username="root" password="REPLACE_WITH_PASSWORD"
        maxActive="100" maxIdle="30" maxWait="10000"
        logAbandoned="true" removeAbandoned="true"
        removeAbandonedTimeout="60" type="javax.sql.DataSource" />
    <ResourceLink name="jdbc/pharma" 
global="jdbc/pharma" type="javax.sql.DataSource" />
</Context>
```

3. Replace the value of `password` to the password you use for the MySQL server.

4. If needed, change the url depending on where your server is.
