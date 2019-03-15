# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Course.create(coursename: 'Python', coursedesc: "Study from the best with this extremely versitile programming language! Program complex algorithms and advanced web applications using this simple language! Using this high-level programming language, you'll be able to reach the top!")
Course.create(coursename: 'Ruby', coursedesc: "Grab this dynamic programming language like its a diamond in the rough! Meet simplicity and elegance coupled with ounces of productivty! With its easy to read language, you can create complex systems within a snap using Rails! Find out more now!")

Group.create(groupname: 'Group 1', submission: 'NONE', review: 'NONE', grade: 0, course_id: 1)
Group.create(groupname: 'Group 2', submission: 'NONE', review: 'NONE', grade: 0, course_id: 1)
Group.create(groupname: 'Group 3', submission: 'NONE', review: 'NONE', grade: 0, course_id: 2)
Group.create(groupname: 'Group 4', submission: 'NONE', review: 'NONE', grade: 0, course_id: 2)

@u1 = User.create(fname: 'Horace', lname: 'Knightly', citizenid: 'C123456789', email: 'horace@email.com', usertype: 1, password: 'qwer1234', password_confirmation: 'qwer1234')
@u2 = User.create(fname: 'James', lname: 'Smith', citizenid: 'C123456788', email: 'james@email.com', usertype: 1, password: 'qwer1234', password_confirmation: 'qwer1234')
@u3 = User.create(fname: 'Teacher', lname: 'King', citizenid: 'C123456787', email: 'teacher@email.com', usertype: 2, password: 'qwer1234', password_confirmation: 'qwer1234')
@u4 = User.create(fname: 'Sonic', lname: 'Porcupine', citizenid: 'C123456786', email: 'sonic@email.com', usertype: 1, password: 'qwer1234', password_confirmation: 'qwer1234')
@u5 = User.create(fname: 'Paul', lname: 'Phoenix', citizenid: 'C123456785', email: 'paul@email.com', usertype: 1, password: 'qwer1234', password_confirmation: 'qwer1234')
@u6 = User.create(fname: 'David', lname: 'Knightly', citizenid: 'C123456784', email: 'david@email.com', usertype: 1, password: 'qwer1234', password_confirmation: 'qwer1234')
@u7 = User.create(fname: 'Quinn', lname: 'Knightly', citizenid: 'C123456783', email: 'quinn@email.com', usertype: 1, password: 'qwer1234', password_confirmation: 'qwer1234')
@u8 = User.create(fname: 'Thomas', lname: 'Knightly', citizenid: 'C123456782', email: 'thomas@email.com', usertype: 1, password: 'qwer1234', password_confirmation: 'qwer1234')
@u9 = User.create(fname: 'Peter', lname: 'Knightly', citizenid: 'C123456781', email: 'peter@email.com', usertype: 0, password: 'qwer1234', password_confirmation: 'qwer1234')
@u10 = User.create(fname: 'Jack', lname: 'Knightly', citizenid: 'C123456780', email: 'horace@email.com', usertype: 0, password: 'qwer1234', password_confirmation: 'qwer1234')

@u1.update(:student_attributes => {studentid: 'S123456789'})
@u2.update(:student_attributes => {studentid: 'S123456788'})
@u4.update(:student_attributes => {studentid: 'S123456787'})
@u5.update(:student_attributes => {studentid: 'S123456786'})
@u6.update(:student_attributes => {studentid: 'S123456785'})
@u7.update(:student_attributes => {studentid: 'S123456784'})
@u8.update(:student_attributes => {studentid: 'S123456783'})

@u3.update(:instructor_attributes => {instructorid: 'I123456789'})

@course1 = Course.find(1)
@u1.courses << @course1
@u2.courses << @course1
@u4.courses << @course1
@u5.courses << @course1
@u6.courses << @course1
@u7.courses << @course1

@course2 = Course.find(2)
@u8.courses << @course2

@group1 = Group.find(1)
@u1.groups << @group1
@u2.groups << @group1
@u4.groups << @group1

@group2 = Group.find(2)
@u5.groups << @group2

@group4 = Group.find(4)
@u8.groups << @group4
