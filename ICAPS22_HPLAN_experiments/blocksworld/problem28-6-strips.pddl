( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b401 - block
    b106 - block
    b64 - block
    b803 - block
    b884 - block
    b69 - block
    b630 - block
    b3 - block
    b329 - block
    b557 - block
    b608 - block
    b68 - block
    b222 - block
    b720 - block
    b399 - block
    b60 - block
    b978 - block
    b666 - block
    b934 - block
    b434 - block
    b667 - block
    b252 - block
    b812 - block
    b9 - block
    b604 - block
    b56 - block
    b697 - block
    b4 - block
    b125 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b401 )
    ( on b106 b401 )
    ( on b64 b106 )
    ( on b803 b64 )
    ( on b884 b803 )
    ( on b69 b884 )
    ( on b630 b69 )
    ( on b3 b630 )
    ( on b329 b3 )
    ( on b557 b329 )
    ( on b608 b557 )
    ( on b68 b608 )
    ( on b222 b68 )
    ( on b720 b222 )
    ( on b399 b720 )
    ( on b60 b399 )
    ( on b978 b60 )
    ( on b666 b978 )
    ( on b934 b666 )
    ( on b434 b934 )
    ( on b667 b434 )
    ( on b252 b667 )
    ( on b812 b252 )
    ( on b9 b812 )
    ( on b604 b9 )
    ( on b56 b604 )
    ( on b697 b56 )
    ( on b4 b697 )
    ( on b125 b4 )
    ( clear b125 )
  )
  ( :goal
    ( and
      ( clear b401 )
    )
  )
)
