-- EXPENSES
create table public.expenses (
  id           uuid default gen_random_uuid() primary key,
  date         date not null,
  description  text not null,
  amount       numeric(12,2) not null,
  category     text default '',
  is_recurring boolean default false,
  recur_key    text default '',
  recur_id     text default '',
  created_at   timestamptz default now()
);
alter table public.expenses enable row level security;
create policy "open" on public.expenses for all using (true) with check (true);

-- INCOME
create table public.income (
  id          uuid default gen_random_uuid() primary key,
  date        date not null,
  description text not null,
  amount      numeric(12,2) not null,
  source      text default '',
  created_at  timestamptz default now()
);
alter table public.income enable row level security;
create policy "open" on public.income for all using (true) with check (true);

-- RECURRING
create table public.recurring (
  id          uuid default gen_random_uuid() primary key,
  description text not null,
  amount      numeric(12,2) not null,
  category    text default '',
  frequency   text not null,
  start_date  date not null,
  created_at  timestamptz default now()
);
alter table public.recurring enable row level security;
create policy "open" on public.recurring for all using (true) with check (true);

-- CATEGORIES
create table public.categories (
  id         uuid default gen_random_uuid() primary key,
  name       text not null unique,
  sort_order integer default 0,
  created_at timestamptz default now()
);
alter table public.categories enable row level security;
create policy "open" on public.categories for all using (true) with check (true);
