( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b746 - block
    b132 - block
    b231 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b746 )
    ( on b132 b746 )
    ( on b231 b132 )
    ( clear b231 )
  )
  ( :goal
    ( and
      ( clear b746 )
    )
  )
)
