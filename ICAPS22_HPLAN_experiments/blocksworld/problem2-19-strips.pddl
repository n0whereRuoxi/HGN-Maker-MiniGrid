( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b168 - block
    b862 - block
    b223 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b168 )
    ( on b862 b168 )
    ( on b223 b862 )
    ( clear b223 )
  )
  ( :goal
    ( and
      ( clear b168 )
    )
  )
)
