( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b602 - block
    b368 - block
    b262 - block
    b448 - block
    b999 - block
    b860 - block
    b859 - block
    b258 - block
    b392 - block
    b700 - block
    b78 - block
    b19 - block
    b475 - block
    b930 - block
    b4 - block
    b883 - block
    b942 - block
    b766 - block
    b261 - block
    b308 - block
    b346 - block
    b780 - block
    b761 - block
    b646 - block
    b903 - block
    b830 - block
    b512 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b602 b424 )
    ( on b368 b602 )
    ( on b262 b368 )
    ( on b448 b262 )
    ( on b999 b448 )
    ( on b860 b999 )
    ( on b859 b860 )
    ( on b258 b859 )
    ( on b392 b258 )
    ( on b700 b392 )
    ( on b78 b700 )
    ( on b19 b78 )
    ( on b475 b19 )
    ( on b930 b475 )
    ( on b4 b930 )
    ( on b883 b4 )
    ( on b942 b883 )
    ( on b766 b942 )
    ( on b261 b766 )
    ( on b308 b261 )
    ( on b346 b308 )
    ( on b780 b346 )
    ( on b761 b780 )
    ( on b646 b761 )
    ( on b903 b646 )
    ( on b830 b903 )
    ( on b512 b830 )
    ( clear b512 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
