CREATE SEQUENCE IF NOT EXISTS books_id_seq START 2 INCREMENT 2;

CREATE TABLE IF NOT EXISTS books (
  book_id     BIGINT PRIMARY KEY DEFAULT nextval('books_id_seq'),
  title       TEXT NOT NULL,
  author      TEXT NOT NULL,
  price       NUMERIC(10,2) NOT NULL DEFAULT 0,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT books_shard_check CHECK (book_id % 2 = 0)
);

INSERT INTO books(title, author, price)
VALUES
  ('Shard2 Book C', 'Author C', 9.99),
  ('Shard2 Book D', 'Author D', 15.00);
