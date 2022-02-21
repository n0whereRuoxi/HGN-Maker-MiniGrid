( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b304 - block
    b141 - block
    b34 - block
    b64 - block
    b924 - block
    b178 - block
    b372 - block
    b589 - block
    b732 - block
    b357 - block
    b525 - block
    b488 - block
    b814 - block
    b880 - block
    b367 - block
    b828 - block
    b39 - block
    b285 - block
    b50 - block
    b336 - block
    b197 - block
    b192 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b304 )
    ( on b141 b304 )
    ( on b34 b141 )
    ( on b64 b34 )
    ( on b924 b64 )
    ( on b178 b924 )
    ( on b372 b178 )
    ( on b589 b372 )
    ( on b732 b589 )
    ( on b357 b732 )
    ( on b525 b357 )
    ( on b488 b525 )
    ( on b814 b488 )
    ( on b880 b814 )
    ( on b367 b880 )
    ( on b828 b367 )
    ( on b39 b828 )
    ( on b285 b39 )
    ( on b50 b285 )
    ( on b336 b50 )
    ( on b197 b336 )
    ( on b192 b197 )
    ( clear b192 )
  )
  ( :goal
    ( and
      ( clear b304 )
    )
  )
)
