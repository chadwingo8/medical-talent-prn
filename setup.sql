-- EXPENSES
create table public.expenses (
  id          uuid default gen_random_uuid() primary key,
  user_id     uuid references auth.users(id) on delete cascade not null,
  date        date not null,
  description text not null,
  amount      numeric(12,2) not null,
  category    text default '',
  is_recurring boolean default false,
  recur_key   text default '',
  recur_id    text default '',
  created_at  timestamptz default now()
);
alter table public.expenses enable row level security;
create policy "Own expenses" on public.expenses for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- INCOME
create table public.income (
  id          uuid default gen_random_uuid() primary key,
  user_id     uuid references auth.users(id) on delete cascade not null,
  date        date not null,
  description text not null,
  amount      numeric(12,2) not null,
  source      text default '',
  created_at  timestamptz default now()
);
alter table public.income enable row level security;
create policy "Own income" on public.income for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- RECURRING
create table public.recurring (
  id          uuid default gen_random_uuid() primary key,
  user_id     uuid references auth.users(id) on delete cascade not null,
  description text not null,
  amount      numeric(12,2) not null,
  category    text default '',
  frequency   text not null,
  start_date  date not null,
  created_at  timestamptz default now()
);
alter table public.recurring enable row level security;
create policy "Own recurring" on public.recurring for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- CATEGORIES
create table public.categories (
  id         uuid default gen_random_uuid() primary key,
  user_id    uuid references auth.users(id) on delete cascade not null,
  name       text not null,
  sort_order integer default 0,
  created_at timestamptz default now(),
  unique(user_id, name)
);
alter table public.categories enable row level security;
create policy "Own categories" on public.categories for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
