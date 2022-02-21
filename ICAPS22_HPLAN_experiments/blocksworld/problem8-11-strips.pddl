( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b395 - block
    b17 - block
    b101 - block
    b961 - block
    b462 - block
    b100 - block
    b910 - block
    b285 - block
    b858 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b395 )
    ( on b17 b395 )
    ( on b101 b17 )
    ( on b961 b101 )
    ( on b462 b961 )
    ( on b100 b462 )
    ( on b910 b100 )
    ( on b285 b910 )
    ( on b858 b285 )
    ( clear b858 )
  )
  ( :goal
    ( and
      ( clear b395 )
    )
  )
)
