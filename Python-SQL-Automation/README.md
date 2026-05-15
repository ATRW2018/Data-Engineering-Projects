# Python to MySQL Data Ingestion Tool

ဒီ Project က Python Script ကို အသုံးပြုပြီး CSV သို့မဟုတ် Structured Data တွေကို MySQL Database ထဲကို အလိုအလျောက် (Automated) ထည့်သွင်းပေးတဲ့ Tool တစ်ခု ဖြစ်ပါတယ်။

## 🚀 Key Features
* **Automated Data Loading:** Data တွေကို Manual ရိုက်ထည့်စရာမလိုဘဲ Python ကနေတစ်ဆင့် Database ထဲကို စက္ကန့်ပိုင်းအတွင်း ပို့ဆောင်ပေးပါတယ်။
* **ETL Pipeline:** Data Engineering ရဲ့ အခြေခံဖြစ်တဲ့ Extract (Data ဖတ်ခြင်း) နဲ့ Load (Data ထည့်ခြင်း) အဆင့်တွေကို လက်တွေ့ အကောင်အထည်ဖော်ထားပါတယ်။
* **Error Handling:** Database Connection မှာ အမှားအယွင်းရှိရင် သိနိုင်အောင် `try-except` block တွေနဲ့ စနစ်တကျ ရေးသားထားပါတယ်။

## 🛠 Tech Stack
* **Language:** Python
* **Libraries:** * `pandas` (Data manipulation အတွက်)
    * `mysql-connector-python` (MySQL နဲ့ ချိတ်ဆက်ရန်)
* **Database:** MySQL

## 📊 Project Workflow
1. **Connection:** Python Script က သတ်မှတ်ထားတဲ့ Host, User နဲ့ Password ကိုသုံးပြီး MySQL နဲ့ ချိတ်ဆက်ပါတယ်။
2. **Processing:** `pandas` library ကိုသုံးပြီး Data တွေကို စနစ်တကျ စုစည်းပါတယ်။
3. **Ingestion:** SQL `INSERT` statement တွေကို အသုံးပြုပြီး Table ထဲသို့ Data များ တစ်ခုချင်းစီ အလိုအလျောက် ထည့်သွင်းပါတယ်။

## 📂 File Structure
* `load_data.py` - Python အဓိက Script ဖိုင်။
* `README.md` - Project အကြောင်း ရှင်းလင်းချက်။

## 📝 How to Use
၁။ `mysql-connector-python` နဲ့ `pandas` ကို Install လုပ်ပါ။
```bash
pip install pandas mysql-connector-python
