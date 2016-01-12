# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### User
User.create(
  [
    { id: 1, email: "ryo@example.com", password: "12345678", encrypted_password: "$2a$10$OgmFDX0wXHLlyAvkoaQjXOox3z26G2J1SSSB7.tfU3tCBf23hZ.Pe" }, #12345678
    { id: 2, email: "user1@example.com", password: "12345678", encrypted_password: "$2a$10$OgmFDX0wXHLlyAvkoaQjXOox3z26G2J1SSSB7.tfU3tCBf23hZ.Pe" }, #12345678
  ],
)

### Category
Category.create(
  [
    { id: 1, name: "自炊", monthly: false, budget: 20000, user_id: 1 },
    { id: 2, name: "外食", monthly: false, budget: 20000, user_id: 1 },
    { id: 3, name: "飲み会", monthly: false, budget: 0, user_id: 1 },
    { id: 4, name: "日用品", monthly: false, budget: 0, user_id: 1 },
    { id: 5, name: "娯楽費", monthly: false, budget: 0, user_id: 1 },
    { id: 6, name: "写真", monthly: false, budget: 0, user_id: 1 },
    { id: 7, name: "服飾", monthly: false, budget: 0, user_id: 1 },
    { id: 8, name: "書籍", monthly: false, budget: 0, user_id: 1 },
    { id: 9, name: "IT", monthly: false, budget: 0, user_id: 1 },
    { id: 10, name: "交通費", monthly: false, budget: 0, user_id: 1 },
    { id: 11, name: "残業代", monthly: false, budget: 0, user_id: 1 },
    { id: 12, name: "その他", monthly: false, budget: 0, user_id: 1 },
    { id: 13, name: "電気代", monthly: true, budget: 3000, user_id: 1 },
    { id: 14, name: "ガス代", monthly: true, budget: 3000, user_id: 1 },
    { id: 15, name: "水道代", monthly: true, budget: 2000, user_id: 1 },
    { id: 16, name: "インターネット", monthly: true, budget: 4000, user_id: 1 },
    { id: 17, name: "携帯", monthly: true, budget: 7000, user_id: 1 },
    { id: 18, name: "家賃", monthly: true, budget: 61000, user_id: 1 },
    { id: 19, name: "定期預金", monthly: true, budget: 20000, user_id: 1 },
    { id: 20, name: "コーヒー", monthly: false, budget: 0, user_id: 1 },
  ]
)

### Salariy
Salary.create(
  [
    { id: 1, year: 2015, money: 220000, user_id: 1 },
    { id: 2, year: 2016, money: 230000, user_id: 1 },
  ]
)

### SalaryDate
SalaryDate.create(
  [
    { id: 1, cutoff: 10, user_id: 1 },
  ]
)

### Record
today = Date.today
Record.create(
  [
    { id: 1, payment: 1000, date: today, card: false, memo: "サンプルデータ1", category_id: 1, user_id: 1 },
    { id: 2, payment: 1000, date: today, card: false, memo: "サンプルデータ2", category_id: 2, user_id: 1 },
    { id: 3, payment: 1000, date: today, card: false, memo: "サンプルデータ3", category_id: 3, user_id: 1 },
    { id: 4, payment: 1000, date: today, card: false, memo: "サンプルデータ4", category_id: 4, user_id: 1 },
    { id: 5, payment: 1000, date: today, card: false, memo: "サンプルデータ5", category_id: 5, user_id: 1 },
    { id: 6, payment: 1000, date: today, card: false, memo: "サンプルデータ6", category_id: 6, user_id: 1 },
    { id: 7, payment: 1000, date: today, card: false, memo: "サンプルデータ7", category_id: 7, user_id: 1 },
    { id: 8, payment: 1000, date: today, card: false, memo: "サンプルデータ8", category_id: 8, user_id: 1 },
    { id: 9, payment: 1000, date: today, card: false, memo: "サンプルデータ9", category_id: 9, user_id: 1 },
    { id: 10, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ10", category_id: 10, user_id: 1 },
    { id: 11, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ11", category_id: 11, user_id: 1 },
    { id: 12, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ12", category_id: 12, user_id: 1 },
    { id: 13, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ13", category_id: 13, user_id: 1 },
    { id: 14, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ14", category_id: 14, user_id: 1 },
    { id: 15, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ15", category_id: 15, user_id: 1 },
    { id: 16, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ16", category_id: 16, user_id: 1 },
    { id: 17, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ17", category_id: 17, user_id: 1 },
    { id: 18, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ18", category_id: 18, user_id: 1 },
    { id: 19, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ19", category_id: 19, user_id: 1 },
    { id: 20, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ20", category_id: 20, user_id: 1 },
    { id: 21, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ21", category_id: 1, user_id: 2 },
    { id: 22, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ22", category_id: 2, user_id: 2 },
    { id: 23, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ23", category_id: 3, user_id: 2 },
    { id: 24, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ24", category_id: 4, user_id: 2 },
    { id: 25, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ25", category_id: 5, user_id: 2 },
    { id: 26, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ26", category_id: 6, user_id: 2 },
    { id: 27, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ27", category_id: 7, user_id: 2 },
    { id: 28, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ28", category_id: 8, user_id: 2 },
    { id: 29, payment: 1000, date: today.next_month, card: true, memo: "サンプルデータ29", category_id: 9, user_id: 2 },
    { id: 30, payment: 1000, date: today, card: false, memo: "サンプルデータ30", category_id: 10, user_id: 2 },
    { id: 31, payment: 1000, date: today, card: false, memo: "サンプルデータ31", category_id: 11, user_id: 2 },
    { id: 32, payment: 1000, date: today, card: false, memo: "サンプルデータ32", category_id: 12, user_id: 2 },
    { id: 33, payment: 1000, date: today, card: false, memo: "サンプルデータ33", category_id: 13, user_id: 2 },
    { id: 34, payment: 1000, date: today, card: false, memo: "サンプルデータ34", category_id: 14, user_id: 2 },
    { id: 35, payment: 1000, date: today, card: false, memo: "サンプルデータ35", category_id: 15, user_id: 2 },
    { id: 36, payment: 1000, date: today, card: false, memo: "サンプルデータ36", category_id: 16, user_id: 2 },
    { id: 37, payment: 1000, date: today, card: false, memo: "サンプルデータ37", category_id: 17, user_id: 2 },
    { id: 38, payment: 1000, date: today, card: false, memo: "サンプルデータ38", category_id: 18, user_id: 2 },
    { id: 39, payment: 1000, date: today, card: false, memo: "サンプルデータ39", category_id: 19, user_id: 2 },
    { id: 40, payment: 1000, date: today, card: false, memo: "サンプルデータ40", category_id: 20, user_id: 2 },
  ]
)
