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
    { id: 2, year: 2016, money: 220000, user_id: 1 },
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
    { id: 1, payment: 1000, date: today, card: false, memo: "サンプルデータ", category_id: 1, user_id: 1 },
  ]
)
