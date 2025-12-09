CREATE DATABASE IF NOT EXISTS onlinebookstore;
USE onlinebookstore;

CREATE TABLE IF NOT EXISTS books(
    barcode varchar(100) PRIMARY KEY,
    name varchar(100),
    author varchar(100),
    price int,
    quantity int
);

CREATE TABLE IF NOT EXISTS users(
    username varchar(100) PRIMARY KEY,
    password varchar(100),
    firstname varchar(100),
    lastname varchar(100),
    address TEXT,
    phone varchar(100),
    mailid varchar(100),
    usertype int
);

INSERT INTO books VALUES('9780134190563','The Go Programming Language','Alan A. A. Donovan and Brian W. Kernighan',400,8);
INSERT INTO books VALUES('9780133053036','C++ Primer','Stanley Lippman and Josée Lajoie and Barbara Moo',976,13);
INSERT INTO books VALUES('9781718500457','The Rust Programming Language','Steve Klabnik and Carol Nichols',560,12);
INSERT INTO books VALUES('9781491910740','Head First Java','Kathy Sierra and Bert Bates and Trisha Gee',754,23);
INSERT INTO books VALUES('9781492056300','Fluent Python','Luciano Ramalho',1014,5);
INSERT INTO books VALUES('9781720043997','The Road to Learn React','Robin Wieruch',239,18);
INSERT INTO books VALUES('9780132350884','Clean Code: A Handbook of Agile Software Craftsmanship','Robert C Martin',288,3);
INSERT INTO books VALUES('9780132181273','Domain-Driven Design','Eric Evans',560,28);
INSERT INTO books VALUES('9781951204006','A Programmers Guide to Computer Science','William Springer',188,4);
INSERT INTO books VALUES('9780316204552','The Soul of a New Machine','Tracy Kidder',293,30);
INSERT INTO books VALUES('9780132778046','Effective Java','Joshua Bloch',368,21);
INSERT INTO books VALUES('9781484255995','Practical Rust Projects','Shing Lyu',257,15);

INSERT INTO users VALUES('demo','demo','Demo','User','Demo Home','42502216225','demo@gmail.com',2);
INSERT INTO users VALUES('Admin','Admin','Mr.','Admin','Haldia WB','9584552224521','admin@gmail.com',1);
INSERT INTO users VALUES('shashi','shashi','Shashi','Raj','Bihar','1236547089','shashi@gmail.com',2);

COMMIT;
