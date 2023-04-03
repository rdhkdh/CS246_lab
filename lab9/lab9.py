# ridhiman kaur dhindsa, roll no.210101088

import mysql.connector
import sys

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="mantra88",
  auth_plugin='mysql_native_password',
  database="week09"
)

mycursor = mydb.cursor()

# Giving output for roll no.180101081 in comments
# task a
print('Indian Institute of Technology Guwahati')
print('Programme Duration: 4 years                      Semesters:Eight(8)')

#task b
mycursor.execute(" SELECT name FROM student18 WHERE roll_number='" +str(sys.argv[1]) +"'; ")
myresult = mycursor.fetchall()
for x in myresult:
  print ("Name:",x[0],"            Roll number:",sys.argv[1])
#Name: TEJAS PRASHANT KHAIRNAR             Roll number: 180101081

#task c
print('Semester     Course          CourseName                    \t\t\tGrade')
mycursor.execute("SELECT course18.semester,grade18.cid,course18.name,grade18.letter_grade \
                FROM course18 NATURAL JOIN grade18 \
                WHERE roll_number='"+str(sys.argv[1])+"' \
                ORDER BY semester; ")
myresult2 = mycursor.fetchall()
prev=1
for x in myresult2:
  if x[0]!=prev:
    print()
  print(x[0],"\t    ",x[1],"\t    ",x[2].ljust(50,' '),x[3])
  prev=x[0]
print()
# Semester     Course          CourseName                                         Grade
# 1            CH101           Chemistry                                          AB
# 1            MA101           Mathematics-1                                      AB
# 1            HS100           English Communication                              BC
# 1            EE101           Basic Electronics                                  DD
# 1            ME111           Engineering Drawing                                AB
# 1            PH101           Physics-1                                          BB
# 1            PH110           Physics Lab/ME110 Workshop                         BC
# 1            CH110           Chemistry Lab                                      CC

# 2            ME110           Workshop/PH110 Physics Lab                         CD
# 2            MA102           Mathematics-2                                      CD
# 2            CS110           Computing Lab                                      BB
# 2            PH102           Physics-2                                          CD
# 2            EE110           Basic Electronics Laboratory                       CC
# 2            CS101           Introduction to Computing                          BB
# 2            BT101           Introductory Biology                               AB
# 2            SA101           Students Activity Course-1                         CD
# 2            ME101           Engineering Mechanics                              BB

# 3            MA222           Elementary Number Theory and Algebra               DD
# 3            CS201           Discrete Mathematics                               CC
# 3            CS203           Algorithms and Data Structures                     CC
# 3            SA201           Students Activity Course-2                         BC
# 3            MA225           Probability Theory and Random Processes            CC
# 3            XX103M          Minor-1                                            DD
# 3            CS242           System Software Lab                                DD
# 3            CS221           Digital Design                                     BB
# 3            CS204           Algorithms and Data Structures Lab                 CC

# 4            CS205           Formal Languages Automata Theory and Computation   BB
# 4            HS101           HSS1-1                                             CD
# 4            SA301           Students Activity Course-3                         BC
# 4            XX104M          Minor-2                                            CC
# 4            CS246           Database Management Systems Lab                    BB
# 4            CS245           Database Management Systems                        BC
# 4            CS224           Hardware Lab                                       AA
# 4            CS223           Computer Architecture and Organization             BB
# 4            CS207           Design and Analysis of Algorithms                  CD

# 5            MA321           Optimization                                       BB
# 5            SA401           Students Activity Course-4                         CC
# 5            XX105M          Minor-3                                            AA
# 5            CS341           Computer Networks                                  BB
# 5            HS102           HSS1-2                                             AB
# 5            CS501           Departmental Elective 5.1                          BB
# 5            CS342           Computer Networks Lab                              BC
# 5            CS343           Operating Systems                                  AA
# 5            CS344           Operating Systems Lab                              BB

# 6            CS405           Departmental Elective Lab 6.3                      AB
# 6            CS404           Departmental Elective 6.2                          AA
# 6            CS403           Departmental Elective 6.1                          DD
# 6            XX101M          Minor-4                                            AA
# 6            CS345           Software Engineering                               AA
# 6            CS346           Software Engineering Lab                           CD
# 6            CS348           Implementation of Programming Languages Lab        CC
# 6            CS361           Machine Learning                                   DD

# 7            HS201           HSS-2-1                                            CC
# 7            XX102M          Minor 5                                            AA
# 7            CS401           Elective 7.2                                       AA
# 7            OE102           Open Elective 2/CS101 Elective 7.1                 CD
# 7            OE101           Open Elective 1                                    CD
# 7            CS498           BTP Phase - 1                                      BB

# 8            CS402           Elective 8.1                                       CD
# 8            OE202           Open Elective 4                                    BC
# 8            OE201           Open Elective 3                                    BB
# 8            CS499           BTP Phase - 2                                      AA
# 8            HS202           HSS-2-2                                            CC

#task d
rollno= sys.argv[1]
for semester in range(1, 9):
    mycursor.execute(f"SELECT SUM(c * CASE letter_grade \
                     WHEN 'AA' THEN 10 \
                     WHEN 'AS' THEN 10 \
                      WHEN 'AB' THEN 9 \
                      WHEN 'BB' THEN 8 \
                     WHEN 'BC' THEN 7 \
                     WHEN 'CC' THEN 6 \
                      WHEN 'CD' THEN 5 \
                     WHEN 'DD' THEN 4 \
                     ELSE 0 END) AS total_grade_points, SUM(c) AS total_credits \
                     FROM grade18 JOIN course18 ON grade18.cid = course18.cid \
                     WHERE roll_number = '{rollno}' AND semester = {semester}") 
    total_grade_points,total_credits = mycursor.fetchone()
    print( "Semester: %d SPI: %4.2f" % (semester,total_grade_points/total_credits) )
print()
# Semester: 1 SPI: 7.58
# Semester: 2 SPI: 6.81
# Semester: 3 SPI: 5.54
# Semester: 4 SPI: 7.09
# Semester: 5 SPI: 8.59
# Semester: 6 SPI: 7.21
# Semester: 7 SPI: 7.43
# Semester: 8 SPI: 7.67

#task e
for semester in range(1, 9):
    mycursor.execute(f"SELECT SUM(c * CASE letter_grade \
                     WHEN 'AA' THEN 10 \
                     WHEN 'AB' THEN 9 \
                     WHEN 'BB' THEN 8 \
                     WHEN 'BC' THEN 7 \
                     WHEN 'CC' THEN 6 \
                     WHEN 'CD' THEN 5 \
                     WHEN 'DD' THEN 4 \
                     ELSE 0 END) AS total_grade_points, SUM(c) AS total_credits \
                     FROM grade18 JOIN course18 ON grade18.cid = course18.cid \
                     WHERE roll_number = '{rollno}' AND semester <= {semester}")
    total_grade_points, total_credits = mycursor.fetchone()
    cpi = total_grade_points/total_credits
    print("Semester: %d  CPI: %.2f " % (semester, cpi))
print()
# Semester: 1  CPI: 7.58 
# Semester: 2  CPI: 7.20 
# Semester: 3  CPI: 6.60 
# Semester: 4  CPI: 6.73 
# Semester: 5  CPI: 7.09 
# Semester: 6  CPI: 7.11 
# Semester: 7  CPI: 7.16 
# Semester: 8  CPI: 7.21 

#task f
for sem in range(1,9):
  mycursor.execute("SELECT cid \
                  FROM curriculum \
                  WHERE number = " + str(sem) + " and (cid not LIKE 'HS101' AND cid NOT LIKE 'SA%' AND cid NOT LIKE 'HS200' AND cid NOT LIKE 'HS1%' AND cid NOT LIKE '%M' or cid like 'XX%') \
                  EXCEPT \
                  SELECT cid \
                  FROM student18 s JOIN grade18 g \
                  ON g.roll_number = s.roll_number \
                  WHERE g.roll_number = " + rollno) 
  missed_courses = mycursor.fetchall()
  if(missed_courses):
    print("No, the student didn't take all the core courses in semester " + str(sem))
  else:
    print("Yes, the student took all the core courses in semester " + str(sem))
print()
# No, the student didn't take all the core courses in semester 1
# No, the student didn't take all the core courses in semester 2
# Yes, the student took all the core courses in semester 3
# Yes, the student took all the core courses in semester 4
# No, the student didn't take all the core courses in semester 5
# No, the student didn't take all the core courses in semester 6
# No, the student didn't take all the core courses in semester 7
# No, the student didn't take all the core courses in semester 8

#task g
for sem in range(1,9):
  mycursor.execute("SELECT cid \
                  FROM curriculum \
                  WHERE number = " + str(sem) + " and (cid like 'CSxxx' or cid like 'CS5%')\
                  EXCEPT \
                  SELECT cid \
                  FROM student18 s JOIN grade18 g \
                  ON g.roll_number = s.roll_number \
                  WHERE g.roll_number = " + rollno) 
  missed_courses = mycursor.fetchall()
  if(missed_courses):
    print("No, the student didn't take all the elective courses in semester " + str(sem))
  else:
    print("Yes, the student took all the elective courses in semester " + str(sem))
print()
# Yes, the student took all the elective courses in semester 1
# Yes, the student took all the elective courses in semester 2
# Yes, the student took all the elective courses in semester 3
# Yes, the student took all the elective courses in semester 4
# No, the student didn't take all the elective courses in semester 5
# No, the student didn't take all the elective courses in semester 6
# No, the student didn't take all the elective courses in semester 7
# No, the student didn't take all the elective courses in semester 8

# task h
for sem in range(1,9):
  mycursor.execute("SELECT cid \
                  FROM curriculum \
                  WHERE number = " + str(sem) + " and (cid like '%M')\
                  EXCEPT \
                  SELECT cid \
                  FROM student18 s JOIN grade18 g \
                  ON g.roll_number = s.roll_number \
                  WHERE g.roll_number = " + rollno) 
  missed_courses = mycursor.fetchall()
  if(missed_courses):
    print("No, the student didn't take all the minor courses in semester " + str(sem))
  else:
    print("Yes, the student took all the minor courses in semester " + str(sem))
print()
# Yes, the student took all the minor courses in semester 1
# Yes, the student took all the minor courses in semester 2
# Yes, the student took all the minor courses in semester 3
# Yes, the student took all the minor courses in semester 4
# Yes, the student took all the minor courses in semester 5
# Yes, the student took all the minor courses in semester 6
# Yes, the student took all the minor courses in semester 7
# Yes, the student took all the minor courses in semester 8

# task i
for sem in range(1,9):
  mycursor.execute("SELECT cid \
                  FROM curriculum \
                  WHERE number = " + str(sem) + " and (cid like 'OE%')\
                  EXCEPT \
                  SELECT cid \
                  FROM student18 s JOIN grade18 g \
                  ON g.roll_number = s.roll_number \
                  WHERE g.roll_number = " + rollno) 
  missed_courses = mycursor.fetchall()
  if(missed_courses):
    print("No, the student didn't take all the open elective courses in semester " + str(sem))
  else:
    print("Yes, the student took all the open elective courses in semester " + str(sem))
print()
# Yes, the student took all the open elective courses in semester 1
# Yes, the student took all the open elective courses in semester 2
# Yes, the student took all the open elective courses in semester 3
# Yes, the student took all the open elective courses in semester 4
# Yes, the student took all the open elective courses in semester 5
# Yes, the student took all the open elective courses in semester 6
# No, the student didn't take all the open elective courses in semester 7
# No, the student didn't take all the open elective courses in semester 8

#task j
for sem in range(1,9):
  mycursor.execute("SELECT cid \
                  FROM curriculum \
                  WHERE number = " + str(sem) + " and (cid like 'HS%')\
                  EXCEPT \
                  SELECT cid \
                  FROM student18 s JOIN grade18 g \
                  ON g.roll_number = s.roll_number \
                  WHERE g.roll_number = " + rollno) 
  missed_courses = mycursor.fetchall()
  if(missed_courses):
    print("No, the student didn't take all the HSS courses in semester " + str(sem))
  else:
    print("Yes, the student took all the HSS courses in semester " + str(sem))
print()
# Yes, the student took all the HSS courses in semester 1
# Yes, the student took all the HSS courses in semester 2
# No, the student didn't take all the HSS courses in semester 3
# No, the student didn't take all the HSS courses in semester 4
# No, the student didn't take all the HSS courses in semester 5
# Yes, the student took all the HSS courses in semester 6
# No, the student didn't take all the HSS courses in semester 7
# No, the student didn't take all the HSS courses in semester 8

#task k
for sem in range(1,9):
  mycursor.execute("SELECT cid \
                  FROM curriculum \
                  WHERE number = " + str(sem) + " and (cid like 'SA%')\
                  EXCEPT \
                  SELECT cid \
                  FROM student18 s JOIN grade18 g \
                  ON g.roll_number = s.roll_number \
                  WHERE g.roll_number = " + rollno) 
  missed_courses = mycursor.fetchall()
  if(missed_courses):
    print("No, the student didn't take all the SA courses in semester " + str(sem))
  else:
    print("Yes, the student took all the SA courses in semester " + str(sem))
print()
# Yes, the student took all the SA courses in semester 1
# No, the student didn't take all the SA courses in semester 2
# No, the student didn't take all the SA courses in semester 3
# No, the student didn't take all the SA courses in semester 4
# No, the student didn't take all the SA courses in semester 5
# Yes, the student took all the SA courses in semester 6
# Yes, the student took all the SA courses in semester 7
# Yes, the student took all the SA courses in semester 8

#task l
for sem in range(1,9):
  mycursor.execute("SELECT cid \
                  FROM student18 NATURAL JOIN grade18 NATURAL JOIN curriculum \
                  WHERE number ='" + str(sem) + "' and letter_grade not in('AA','AB','BB','BC','CC','CD','DD')\
                  ") 
  failed_courses = mycursor.fetchall()
  if(failed_courses):
    print("No, the student didn't pass all courses in semester " + str(sem))
  else:
    print("Yes, the student passed all courses in semester " + str(sem))
print()
# Yes, the student passed all courses in semester 1
# Yes, the student passed all courses in semester 2
# Yes, the student passed all courses in semester 3
# Yes, the student passed all courses in semester 4
# Yes, the student passed all courses in semester 5
# Yes, the student passed all courses in semester 6
# Yes, the student passed all courses in semester 7
# Yes, the student passed all courses in semester 8

#task m
for sem in range(1,9):
  mycursor.execute("SELECT cid \
                  FROM student18 NATURAL JOIN grade18 NATURAL JOIN curriculum \
                  WHERE number ='" + str(sem) + "' and cid like 'SA%' and letter_grade not in('AA','AB','BB','BC','CC','CD','DD')\
                  ") 
  failed_courses = mycursor.fetchall()
  if(failed_courses):
    print("No, the student didn't pass all SA courses in semester " + str(sem))
  else:
    print("Yes, the student passed all SA courses in semester " + str(sem))
print()
#  Yes, the student passed all SA courses in semester 1
# Yes, the student passed all SA courses in semester 2
# Yes, the student passed all SA courses in semester 3
# Yes, the student passed all SA courses in semester 4
# Yes, the student passed all SA courses in semester 5
# Yes, the student passed all SA courses in semester 6
# Yes, the student passed all SA courses in semester 7
# Yes, the student passed all SA courses in semester 8

