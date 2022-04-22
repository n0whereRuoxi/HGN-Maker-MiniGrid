( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b151 - block
    b612 - block
    b486 - block
    b703 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b151 )
    ( on b612 b151 )
    ( on b486 b612 )
    ( on b703 b486 )
    ( clear b703 )
  )
  ( :goal
    ( and
      ( clear b151 )
    )
  )
)
