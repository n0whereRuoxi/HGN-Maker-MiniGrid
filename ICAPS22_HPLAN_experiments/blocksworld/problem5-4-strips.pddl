( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b610 - block
    b144 - block
    b569 - block
    b522 - block
    b831 - block
    b540 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b610 )
    ( on b144 b610 )
    ( on b569 b144 )
    ( on b522 b569 )
    ( on b831 b522 )
    ( on b540 b831 )
    ( clear b540 )
  )
  ( :goal
    ( and
      ( clear b610 )
    )
  )
)
