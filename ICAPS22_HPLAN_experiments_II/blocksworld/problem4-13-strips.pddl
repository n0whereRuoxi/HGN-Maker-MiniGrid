( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b867 - block
    b315 - block
    b314 - block
    b585 - block
    b709 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b867 )
    ( on b315 b867 )
    ( on b314 b315 )
    ( on b585 b314 )
    ( on b709 b585 )
    ( clear b709 )
  )
  ( :goal
    ( and
      ( clear b867 )
    )
  )
)
