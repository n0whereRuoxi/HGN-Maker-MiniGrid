( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b541 - block
    b566 - block
    b556 - block
    b483 - block
    b131 - block
    b491 - block
    b80 - block
    b287 - block
    b213 - block
    b66 - block
    b730 - block
    b411 - block
    b129 - block
    b8 - block
    b295 - block
    b181 - block
    b950 - block
    b24 - block
    b303 - block
    b797 - block
    b534 - block
    b672 - block
    b18 - block
    b184 - block
    b812 - block
    b742 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b541 )
    ( on b566 b541 )
    ( on b556 b566 )
    ( on b483 b556 )
    ( on b131 b483 )
    ( on b491 b131 )
    ( on b80 b491 )
    ( on b287 b80 )
    ( on b213 b287 )
    ( on b66 b213 )
    ( on b730 b66 )
    ( on b411 b730 )
    ( on b129 b411 )
    ( on b8 b129 )
    ( on b295 b8 )
    ( on b181 b295 )
    ( on b950 b181 )
    ( on b24 b950 )
    ( on b303 b24 )
    ( on b797 b303 )
    ( on b534 b797 )
    ( on b672 b534 )
    ( on b18 b672 )
    ( on b184 b18 )
    ( on b812 b184 )
    ( on b742 b812 )
    ( clear b742 )
  )
  ( :goal
    ( and
      ( clear b541 )
    )
  )
)
