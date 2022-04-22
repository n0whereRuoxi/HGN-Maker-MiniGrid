( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b41 - block
    b595 - block
    b332 - block
    b628 - block
    b191 - block
    b824 - block
    b767 - block
    b482 - block
    b138 - block
    b831 - block
    b106 - block
    b673 - block
    b43 - block
    b48 - block
    b522 - block
    b252 - block
    b323 - block
    b799 - block
    b403 - block
    b636 - block
    b228 - block
    b420 - block
    b958 - block
    b946 - block
    b12 - block
    b329 - block
    b390 - block
    b873 - block
    b413 - block
    b833 - block
    b662 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b41 )
    ( on b595 b41 )
    ( on b332 b595 )
    ( on b628 b332 )
    ( on b191 b628 )
    ( on b824 b191 )
    ( on b767 b824 )
    ( on b482 b767 )
    ( on b138 b482 )
    ( on b831 b138 )
    ( on b106 b831 )
    ( on b673 b106 )
    ( on b43 b673 )
    ( on b48 b43 )
    ( on b522 b48 )
    ( on b252 b522 )
    ( on b323 b252 )
    ( on b799 b323 )
    ( on b403 b799 )
    ( on b636 b403 )
    ( on b228 b636 )
    ( on b420 b228 )
    ( on b958 b420 )
    ( on b946 b958 )
    ( on b12 b946 )
    ( on b329 b12 )
    ( on b390 b329 )
    ( on b873 b390 )
    ( on b413 b873 )
    ( on b833 b413 )
    ( on b662 b833 )
    ( clear b662 )
  )
  ( :goal
    ( and
      ( clear b41 )
    )
  )
)
