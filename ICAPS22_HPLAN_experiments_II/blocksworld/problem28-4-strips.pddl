( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b327 - block
    b425 - block
    b72 - block
    b577 - block
    b517 - block
    b106 - block
    b560 - block
    b682 - block
    b816 - block
    b778 - block
    b570 - block
    b902 - block
    b884 - block
    b397 - block
    b801 - block
    b836 - block
    b67 - block
    b743 - block
    b963 - block
    b60 - block
    b692 - block
    b999 - block
    b370 - block
    b764 - block
    b716 - block
    b172 - block
    b420 - block
    b344 - block
    b314 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b327 )
    ( on b425 b327 )
    ( on b72 b425 )
    ( on b577 b72 )
    ( on b517 b577 )
    ( on b106 b517 )
    ( on b560 b106 )
    ( on b682 b560 )
    ( on b816 b682 )
    ( on b778 b816 )
    ( on b570 b778 )
    ( on b902 b570 )
    ( on b884 b902 )
    ( on b397 b884 )
    ( on b801 b397 )
    ( on b836 b801 )
    ( on b67 b836 )
    ( on b743 b67 )
    ( on b963 b743 )
    ( on b60 b963 )
    ( on b692 b60 )
    ( on b999 b692 )
    ( on b370 b999 )
    ( on b764 b370 )
    ( on b716 b764 )
    ( on b172 b716 )
    ( on b420 b172 )
    ( on b344 b420 )
    ( on b314 b344 )
    ( clear b314 )
  )
  ( :goal
    ( and
      ( clear b327 )
    )
  )
)
