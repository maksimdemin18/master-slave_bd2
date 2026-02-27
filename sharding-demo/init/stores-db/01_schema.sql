CREATE TABLE IF NOT EXISTS stores (
  store_id    BIGSERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  city        TEXT NOT NULL,
  address     TEXT NOT NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO stores(name, city, address)
VALUES
  ('BookShop #1', 'Moscow', 'Tverskaya 10'),
  ('BookShop #2', 'SPb',    'Nevsky 10')
ON CONFLICT DO NOTHING;
