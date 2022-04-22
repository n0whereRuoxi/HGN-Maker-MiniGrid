( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b517 - block
    b327 - block
    b658 - block
    b370 - block
    b9 - block
    b952 - block
    b527 - block
    b69 - block
    b705 - block
    b232 - block
    b594 - block
    b71 - block
    b754 - block
    b122 - block
    b610 - block
    b216 - block
    b248 - block
    b194 - block
    b834 - block
    b848 - block
    b987 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b517 )
    ( on b327 b517 )
    ( on b658 b327 )
    ( on b370 b658 )
    ( on b9 b370 )
    ( on b952 b9 )
    ( on b527 b952 )
    ( on b69 b527 )
    ( on b705 b69 )
    ( on b232 b705 )
    ( on b594 b232 )
    ( on b71 b594 )
    ( on b754 b71 )
    ( on b122 b754 )
    ( on b610 b122 )
    ( on b216 b610 )
    ( on b248 b216 )
    ( on b194 b248 )
    ( on b834 b194 )
    ( on b848 b834 )
    ( on b987 b848 )
    ( clear b987 )
  )
  ( :goal
    ( and
      ( clear b517 )
    )
  )
)
