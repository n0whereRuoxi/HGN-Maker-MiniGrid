( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b89 - block
    b903 - block
    b665 - block
    b137 - block
    b52 - block
    b218 - block
    b195 - block
    b752 - block
    b482 - block
    b529 - block
    b688 - block
    b955 - block
    b596 - block
    b44 - block
    b930 - block
    b805 - block
    b430 - block
    b902 - block
    b40 - block
    b524 - block
    b356 - block
    b904 - block
    b813 - block
    b973 - block
    b352 - block
    b370 - block
    b388 - block
    b318 - block
    b91 - block
    b349 - block
    b219 - block
    b785 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b89 )
    ( on b903 b89 )
    ( on b665 b903 )
    ( on b137 b665 )
    ( on b52 b137 )
    ( on b218 b52 )
    ( on b195 b218 )
    ( on b752 b195 )
    ( on b482 b752 )
    ( on b529 b482 )
    ( on b688 b529 )
    ( on b955 b688 )
    ( on b596 b955 )
    ( on b44 b596 )
    ( on b930 b44 )
    ( on b805 b930 )
    ( on b430 b805 )
    ( on b902 b430 )
    ( on b40 b902 )
    ( on b524 b40 )
    ( on b356 b524 )
    ( on b904 b356 )
    ( on b813 b904 )
    ( on b973 b813 )
    ( on b352 b973 )
    ( on b370 b352 )
    ( on b388 b370 )
    ( on b318 b388 )
    ( on b91 b318 )
    ( on b349 b91 )
    ( on b219 b349 )
    ( on b785 b219 )
    ( clear b785 )
  )
  ( :goal
    ( and
      ( clear b89 )
    )
  )
)
