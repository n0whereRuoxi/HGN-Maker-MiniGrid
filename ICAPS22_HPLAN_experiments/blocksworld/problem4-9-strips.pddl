( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b760 - block
    b102 - block
    b486 - block
    b578 - block
    b373 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b760 )
    ( on b102 b760 )
    ( on b486 b102 )
    ( on b578 b486 )
    ( on b373 b578 )
    ( clear b373 )
  )
  ( :goal
    ( and
      ( clear b760 )
    )
  )
)
