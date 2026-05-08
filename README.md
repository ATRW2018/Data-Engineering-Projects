# Data-Engineering-Projects
# HR Management System - Database Design

ဒီ Project က ကုမ္ပဏီတစ်ခုရဲ့ HR လုပ်ငန်းစဉ်တွေကို စီမံခန့်ခွဲနိုင်ဖို့အတွက် Database Schema တစ်ခုကို SQL နဲ့ တည်ဆောက်ထားတာ ဖြစ်ပါတယ်။ 

## 📌 Project Overview
ဝန်ထမ်းအချက်အလက်များ၊ ဌာနများ၊ ရာထူးများ၊ တက်ရောက်မှု (Attendance)၊ လစာစာရင်း (Payroll) နဲ့ ခွင့်တိုင်ကြားမှု (Leave Requests) စတာတွေကို စနစ်တကျ သိမ်းဆည်းနိုင်အောင် ရေးသားထားပါတယ်။

## 🛠 Tech Stack
* **Database:** MySQL
* **Language:** SQL

## 📊 Database Features
ဒီ SQL script ထဲမှာ အောက်ပါ Table ပေါင်း (၁၀) ခု ပါဝင်ပါတယ်-
1.  **Employees** - ဝန်ထမ်းကိုယ်ရေးအချက်အလက်
2.  **Departments** - ဌာနခွဲများ
3.  **Job Positions** - ရာထူးနှင့် အခြေခံလစာ
4.  **Payroll** - လစာတွက်ချက်မှုမှတ်တမ်း
5.  **Attendance** - အလုပ်တက်/ဆင်း မှတ်တမ်း
6.  **Leave Requests/Types** - ခွင့်တိုင်ကြားမှုများ
7.  **Performance Reviews** - ဝန်ထမ်းအကဲဖြတ်ချက်များ
8.  **Training Records** - သင်တန်းမှတ်တမ်းများ
9.  **Recruitment** - အလုပ်လျှောက်ထားသူများ

## 🚀 How to Use
1. MySQL Server (XAMPP သို့မဟုတ် MySQL Workbench) ကို ဖွင့်ပါ။
2. Database အသစ်တစ်ခု ဆောက်ပါ။ (`CREATE DATABASE hr_db;`)
3. `hr_queries.sql` (သို့မဟုတ် သင့်ဖိုင်နာမည်) ကို Import လုပ်ပြီး Run ပါ။
4. အဆင်သင့်ထည့်ပေးထားတဲ့ Demo Data များကို အသုံးပြုနိုင်ပါပြီ။

---
*Created as part of my Data Engineering learning journey.*
