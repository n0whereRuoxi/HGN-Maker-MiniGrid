( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b977 - block
    b567 - block
    b901 - block
    b722 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b977 )
    ( on b567 b977 )
    ( on b901 b567 )
    ( on b722 b901 )
    ( clear b722 )
  )
  ( :goal
    ( and
      ( clear b977 )
    )
  )
)
