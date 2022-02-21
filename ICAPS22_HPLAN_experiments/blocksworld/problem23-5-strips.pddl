( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b604 - block
    b581 - block
    b559 - block
    b301 - block
    b284 - block
    b816 - block
    b865 - block
    b603 - block
    b712 - block
    b131 - block
    b278 - block
    b884 - block
    b789 - block
    b358 - block
    b88 - block
    b317 - block
    b823 - block
    b346 - block
    b314 - block
    b271 - block
    b971 - block
    b429 - block
    b940 - block
    b26 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b604 )
    ( on b581 b604 )
    ( on b559 b581 )
    ( on b301 b559 )
    ( on b284 b301 )
    ( on b816 b284 )
    ( on b865 b816 )
    ( on b603 b865 )
    ( on b712 b603 )
    ( on b131 b712 )
    ( on b278 b131 )
    ( on b884 b278 )
    ( on b789 b884 )
    ( on b358 b789 )
    ( on b88 b358 )
    ( on b317 b88 )
    ( on b823 b317 )
    ( on b346 b823 )
    ( on b314 b346 )
    ( on b271 b314 )
    ( on b971 b271 )
    ( on b429 b971 )
    ( on b940 b429 )
    ( on b26 b940 )
    ( clear b26 )
  )
  ( :goal
    ( and
      ( clear b604 )
    )
  )
)
