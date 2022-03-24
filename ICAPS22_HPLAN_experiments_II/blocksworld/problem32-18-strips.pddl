( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b47 - block
    b896 - block
    b208 - block
    b226 - block
    b987 - block
    b352 - block
    b925 - block
    b650 - block
    b323 - block
    b625 - block
    b311 - block
    b807 - block
    b683 - block
    b569 - block
    b674 - block
    b672 - block
    b633 - block
    b350 - block
    b872 - block
    b218 - block
    b81 - block
    b148 - block
    b950 - block
    b368 - block
    b740 - block
    b436 - block
    b720 - block
    b126 - block
    b793 - block
    b192 - block
    b977 - block
    b229 - block
    b426 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b47 )
    ( on b896 b47 )
    ( on b208 b896 )
    ( on b226 b208 )
    ( on b987 b226 )
    ( on b352 b987 )
    ( on b925 b352 )
    ( on b650 b925 )
    ( on b323 b650 )
    ( on b625 b323 )
    ( on b311 b625 )
    ( on b807 b311 )
    ( on b683 b807 )
    ( on b569 b683 )
    ( on b674 b569 )
    ( on b672 b674 )
    ( on b633 b672 )
    ( on b350 b633 )
    ( on b872 b350 )
    ( on b218 b872 )
    ( on b81 b218 )
    ( on b148 b81 )
    ( on b950 b148 )
    ( on b368 b950 )
    ( on b740 b368 )
    ( on b436 b740 )
    ( on b720 b436 )
    ( on b126 b720 )
    ( on b793 b126 )
    ( on b192 b793 )
    ( on b977 b192 )
    ( on b229 b977 )
    ( on b426 b229 )
    ( clear b426 )
  )
  ( :goal
    ( and
      ( clear b47 )
    )
  )
)
