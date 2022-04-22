( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b949 - block
    b528 - block
    b254 - block
    b702 - block
    b255 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b949 )
    ( on b528 b949 )
    ( on b254 b528 )
    ( on b702 b254 )
    ( on b255 b702 )
    ( clear b255 )
  )
  ( :goal
    ( and
      ( clear b949 )
    )
  )
)
