CREATE SEQUENCE IF NOT EXISTS books_id_seq START 1 INCREMENT 2;

CREATE TABLE IF NOT EXISTS books (
  book_id     BIGINT PRIMARY KEY DEFAULT nextval('books_id_seq'),
  title       TEXT NOT NULL,
  author      TEXT NOT NULL,
  price       NUMERIC(10,2) NOT NULL DEFAULT 0,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),

  -- защита от "ошибочной записи" на не тот шард
  CONSTRAINT books_shard_check CHECK (book_id % 2 = 1)
);

-- пример данных
INSERT INTO books(title, author, price)
VALUES
  ('Shard1 Book A', 'Author A', 10.00),
  ('Shard1 Book B', 'Author B', 12.50);
