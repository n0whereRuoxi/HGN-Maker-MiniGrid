( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b226 - block
    b833 - block
    b52 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b226 )
    ( on b833 b226 )
    ( on b52 b833 )
    ( clear b52 )
  )
  ( :goal
    ( and
      ( clear b226 )
    )
  )
)
