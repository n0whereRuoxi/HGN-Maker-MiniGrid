( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b231 - block
    b319 - block
    b336 - block
    b816 - block
    b519 - block
    b117 - block
    b325 - block
    b72 - block
    b219 - block
    b131 - block
    b841 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b231 )
    ( on b319 b231 )
    ( on b336 b319 )
    ( on b816 b336 )
    ( on b519 b816 )
    ( on b117 b519 )
    ( on b325 b117 )
    ( on b72 b325 )
    ( on b219 b72 )
    ( on b131 b219 )
    ( on b841 b131 )
    ( clear b841 )
  )
  ( :goal
    ( and
      ( clear b231 )
    )
  )
)
