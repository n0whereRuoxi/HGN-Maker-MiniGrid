( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b430 - block
    b455 - block
    b345 - block
    b672 - block
    b199 - block
    b159 - block
    b262 - block
    b31 - block
    b439 - block
    b525 - block
    b537 - block
    b409 - block
    b77 - block
    b304 - block
    b888 - block
    b122 - block
    b145 - block
    b839 - block
    b339 - block
    b110 - block
    b533 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b430 )
    ( on b455 b430 )
    ( on b345 b455 )
    ( on b672 b345 )
    ( on b199 b672 )
    ( on b159 b199 )
    ( on b262 b159 )
    ( on b31 b262 )
    ( on b439 b31 )
    ( on b525 b439 )
    ( on b537 b525 )
    ( on b409 b537 )
    ( on b77 b409 )
    ( on b304 b77 )
    ( on b888 b304 )
    ( on b122 b888 )
    ( on b145 b122 )
    ( on b839 b145 )
    ( on b339 b839 )
    ( on b110 b339 )
    ( on b533 b110 )
    ( clear b533 )
  )
  ( :goal
    ( and
      ( clear b430 )
    )
  )
)
