( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b152 - block
    b940 - block
    b734 - block
    b283 - block
    b828 - block
    b812 - block
    b425 - block
    b365 - block
    b286 - block
    b241 - block
    b36 - block
    b432 - block
    b975 - block
    b966 - block
    b124 - block
    b307 - block
    b238 - block
    b868 - block
    b403 - block
    b204 - block
    b779 - block
    b5 - block
    b693 - block
    b385 - block
    b886 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b152 )
    ( on b940 b152 )
    ( on b734 b940 )
    ( on b283 b734 )
    ( on b828 b283 )
    ( on b812 b828 )
    ( on b425 b812 )
    ( on b365 b425 )
    ( on b286 b365 )
    ( on b241 b286 )
    ( on b36 b241 )
    ( on b432 b36 )
    ( on b975 b432 )
    ( on b966 b975 )
    ( on b124 b966 )
    ( on b307 b124 )
    ( on b238 b307 )
    ( on b868 b238 )
    ( on b403 b868 )
    ( on b204 b403 )
    ( on b779 b204 )
    ( on b5 b779 )
    ( on b693 b5 )
    ( on b385 b693 )
    ( on b886 b385 )
    ( clear b886 )
  )
  ( :goal
    ( and
      ( clear b152 )
    )
  )
)
