( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b586 - block
    b72 - block
    b619 - block
    b62 - block
    b199 - block
    b833 - block
    b905 - block
    b359 - block
    b798 - block
    b263 - block
    b154 - block
    b898 - block
    b472 - block
    b934 - block
    b494 - block
    b987 - block
    b801 - block
    b384 - block
    b895 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b586 )
    ( on b72 b586 )
    ( on b619 b72 )
    ( on b62 b619 )
    ( on b199 b62 )
    ( on b833 b199 )
    ( on b905 b833 )
    ( on b359 b905 )
    ( on b798 b359 )
    ( on b263 b798 )
    ( on b154 b263 )
    ( on b898 b154 )
    ( on b472 b898 )
    ( on b934 b472 )
    ( on b494 b934 )
    ( on b987 b494 )
    ( on b801 b987 )
    ( on b384 b801 )
    ( on b895 b384 )
    ( clear b895 )
  )
  ( :goal
    ( and
      ( clear b586 )
    )
  )
)
