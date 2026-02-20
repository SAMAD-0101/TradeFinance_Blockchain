# 🚀 Your Final Deployment Guide

Since I cannot click "Deploy" for you (I don't have your login), follow these **3 Steps** to get your link and password.

## Step 1: Get the Database (Free)
1.  Go to [Neon.tech](https://neon.tech/) and sign up.
2.  Create a Project.
3.  Copy the **Connection String** from the Dashboard (e.g., `postgres://user:pass@ep-xyz.aws.neon.tech/neondb...`).
4.  Click **SQL Editor** in Neon Dashboard.
5.  **Run this Command** to create your Login User:
    ```sql
    DELETE FROM users;
    INSERT INTO users (user_code, name, email, password, role, org_name, is_active)
    VALUES 
    ('AS26ADM001', 'Admin', 'admin@tradefinance.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'admin', 'Trade Finance Platform', true);
    ```
    *(Password is set to: `password`)*

## Step 2: Deploy Code (Free)
1.  Go to [Netlify.com](https://app.netlify.com/).
2.  Click **Add new site** -> **Import an existing project**.
3.  Select GitHub -> `SAMAD-0101/TradeFinance_Blockchain`.
4.  Netlify will auto-fill the settings.
5.  **Add Environment Variable** (Crucial!):
    *   Key: `NETLIFY_DATABASE_URL`
    *   Value: *(Paste your Neon Connection String from Step 1)*
6.  Click **Deploy**.

## Step 3: Login & Success! 🎉
Once Netlify finishes building (2-3 mins), they will give you a link like:
👉 `https://random-name-12345.netlify.app`

**Login Credentials:**
- **URL**: (Your Netlify Link)
- **Email**: `admin@tradefinance.com`
- **Password**: `password`
