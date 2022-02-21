( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b833 - block
    b644 - block
    b493 - block
    b851 - block
    b505 - block
    b168 - block
    b204 - block
    b177 - block
    b623 - block
    b11 - block
    b636 - block
    b344 - block
    b289 - block
    b519 - block
    b515 - block
    b102 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b833 )
    ( on b644 b833 )
    ( on b493 b644 )
    ( on b851 b493 )
    ( on b505 b851 )
    ( on b168 b505 )
    ( on b204 b168 )
    ( on b177 b204 )
    ( on b623 b177 )
    ( on b11 b623 )
    ( on b636 b11 )
    ( on b344 b636 )
    ( on b289 b344 )
    ( on b519 b289 )
    ( on b515 b519 )
    ( on b102 b515 )
    ( clear b102 )
  )
  ( :goal
    ( and
      ( clear b833 )
    )
  )
)
