-- 수박게임 리더보드 (Supabase SQL Editor에서 1회만 실행)
create table suika_rankings (
  id bigint generated always as identity primary key,
  name text not null check (char_length(name) between 1 and 12),
  score int not null check (score >= 0),
  created_at timestamptz not null default now()
);

alter table suika_rankings enable row level security;

-- 익명(publishable key)으로 등록/조회만 허용, 수정/삭제는 차단
create policy "anon insert" on suika_rankings for insert to anon with check (true);
create policy "anon select" on suika_rankings for select to anon using (true);
