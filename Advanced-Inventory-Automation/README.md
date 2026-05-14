# Advanced Inventory Management System (with SQL Triggers)

ဒီ Project က လုပ်ငန်းတစ်ခုရဲ့ ပစ္စည်းလက်ကျန်တွေကို အလိုအလျောက် စောင့်ကြည့်ပေးမယ့် System တစ်ခု ဖြစ်ပါတယ်။ 

## 🚀 Key Features
* **Automated Stock Alerts:** ပစ္စည်းလက်ကျန်က သတ်မှတ်ထားတဲ့ Minimum Level အောက် နည်းသွားတာနဲ့ System က `stock_alerts` table ထဲကို အလိုအလျောက် Warning Message ပို့ပေးပါတယ်။
* **Event-Driven Logic:** MySQL Triggers ကို အသုံးပြုပြီး Database အဆင့်မှာတင် Logic ကို ကိုင်တွယ်ထားတာကြောင့် ပိုမိုမြန်ဆန်ပြီး တိကျပါတယ်။
* **Relational Data Modeling:** Suppliers, Products နဲ့ Alerts Table တွေကို Foreign Keys တွေနဲ့ စနစ်တကျ ချိတ်ဆက်ထားပါတယ်။

## 🛠 Tech Stack
* **Database:** MySQL
* **Tools:** MySQL Workbench
* **Language:** SQL

## 📊 How it works
1. ပစ္စည်းတစ်ခုခု အရောင်းအဝယ်ဖြစ်လို့ `stock_quantity` ကျသွားတဲ့အခါ...
2. `check_stock_after_update` ဆိုတဲ့ Trigger က အလိုအလျောက် စစ်ဆေးပါတယ်။
3. အကယ်၍ လက်ကျန်က `min_stock_level` ထက် နည်းနေရင် `stock_alerts` table ထဲမှာ သတိပေးချက်တစ်ခု ချက်ချင်း သိမ်းဆည်းပေးမှာ ဖြစ်ပါတယ်။

## 📝 Sample Query
```sql
-- Alert တက်လာတာကို စစ်ဆေးရန်
SELECT * FROM stock_alerts;
