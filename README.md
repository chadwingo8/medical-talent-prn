# Medical Talent PRN — Expense & Income Tracker

## Setup (one time, ~10 minutes)

---

### Step 1 — Supabase: Create the database tables

1. Go to **supabase.com** → your project → **SQL Editor**
2. Copy everything from `setup.sql` and paste it in
3. Click **Run**

---

### Step 2 — Supabase: Get your API credentials

1. In Supabase go to **Project Settings → API**
2. Copy your **Project URL** and **anon public** key
3. Open `config.js` and paste them in:

```js
const SUPABASE_URL      = 'https://xxxx.supabase.co';
const SUPABASE_ANON_KEY = 'eyJh...';
```

---

### Step 3 — GitHub: Push the files

1. Create a new **public** repo on GitHub (e.g. `medical-talent-prn`)
2. Upload all 4 files: `index.html`, `app.html`, `config.js`, `setup.sql`
   - Or use: `git init`, `git add .`, `git commit -m "init"`, `git push`

---

### Step 4 — Vercel: Deploy

1. Go to **vercel.com** → **Add New Project**
2. Import your GitHub repo
3. Leave all settings as default → click **Deploy**
4. Vercel gives you a live URL like `https://medical-talent-prn.vercel.app`

---

### Step 5 — Done!

Open your Vercel URL, create an account, and start tracking.
Data is saved to Supabase and works from any device.

---

## Files

| File | Purpose |
|------|---------|
| `index.html` | Login / signup page |
| `app.html` | Main tracker app |
| `config.js` | Your Supabase credentials |
| `setup.sql` | Run once in Supabase SQL Editor |
