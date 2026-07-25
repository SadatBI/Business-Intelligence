# Employee Attrition Analysis

## ❓ The Problem
High attrition rates cost companies a lot of money in hiring and training, and it hurts team morale. Biliv-Augmenta has been losing staff, and my goal was to use Power BI to dig through our employee data, find the patterns behind why people resign, and give our HR team some practical ideas to fix it.

---

* **Tool Used:** Power BI Desktop
* **Skills Practiced:** Data modeling, writing DAX formulas, choosing the right charts, and data storytelling.

---

## 📊 Quick Numbers (The KPIs)
When I first loaded the data, I pulled these high-level metrics to understand the current state of the company:
* **Total Employees Ever Tracked:** 1,470
* **Current Active Employees:** 1,233
* **Employees Who Left (Inactive):** 237
* **Overall Attrition Rate:** 16.1%
* **Age Range:** Our youngest employee is 18, and our oldest is 51.

---

## 🔍 What the Data Told Me (My Insights)

After building out the charts, a few major trends really jumped out at me:

### 1. Burnout is a Real Issue
* **The Overtime Trap:** This was the biggest shocker. Employees who work overtime have an attrition rate of **over 30%**. For people who don't work overtime, it is only around 10%. 
* **Too Much Travel:** People who have to travel frequently for business have a much higher turnover rate (~25%) than those who rarely or never travel (~7%).

### 2. The "New Guy" Vulnerability
* **Manager Issues:** I noticed that attrition peaks heavily at **25%** during an employee's very first year (`Year 0`) with a new manager. Once they work together for 3 or 4 years, that number drops below 5%. Early relationships matter!
* **The Promotion Cliff:** Interestingly, right after someone gets a promotion or starts a new role (`Year 0` since last promotion), the turnover rate spikes close to **40%**. It seems employees are highly likely to leave if they feel stuck immediately following a major transition.

### 3. Who is Leaving Most?
* **By Department:** Our **Sales** department has the highest turnover rate (over 20%), with **Human Resources** right behind it (~19%). **Technology** is our most stable department (~14%).
* **By Demographics:** The vast majority of our workforce sits in the **20-29 age group** (874 employees). Because this group is so large, their high tendency to change jobs is driving most of our overall attrition. Also, single employees leave at a much higher rate than married or divorced staff.

---

##💡 My Recommendations for HR

Based on the charts, here is what I think we should suggest to the leadership team:
1. **Fix the Overtime Culture:** We need to keep an eye on teams working late. If a department is consistently hitting that 30% turnover mark, it is time to hire more help or redistribute the work.
2. **Focus on New Managers:** HR should set up check-ins during the first 90 days when an employee gets paired with a new manager to help build a smooth relationship.
3. **Re-evaluate Sales Roles:** Since Sales is losing the most people, we should look into their commission structures or travel expectations to see if we can make frequent travel a bit easier on them.

---

*Thank you for checking out my project! Feel free to connect with me or leave feedback on my dashboard layout!*
