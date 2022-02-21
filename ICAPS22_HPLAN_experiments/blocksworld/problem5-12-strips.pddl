( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b257 - block
    b55 - block
    b11 - block
    b159 - block
    b702 - block
    b692 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b257 )
    ( on b55 b257 )
    ( on b11 b55 )
    ( on b159 b11 )
    ( on b702 b159 )
    ( on b692 b702 )
    ( clear b692 )
  )
  ( :goal
    ( and
      ( clear b257 )
    )
  )
)
