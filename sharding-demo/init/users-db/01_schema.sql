CREATE TABLE IF NOT EXISTS users (
  user_id     BIGSERIAL PRIMARY KEY,
  email       TEXT NOT NULL UNIQUE,
  full_name   TEXT NOT NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO users(email, full_name)
VALUES
  ('ali@example.com', 'Ali Jopson'),
  ('agent@example.com',   'Agent Smith')
ON CONFLICT (email) DO NOTHING;
