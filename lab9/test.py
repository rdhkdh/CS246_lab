import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="mantra88",
  auth_plugin='mysql_native_password',
  #database="mydatabase"
)

# test 1 - create connection
# print(mydb)

#test2
mycursor = mydb.cursor()
# mycursor.execute("CREATE DATABASE rkd1")

#test3
mycursor.execute("SHOW DATABASES")
for x in mycursor:
  print(x)

mycursor.execute("CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))")