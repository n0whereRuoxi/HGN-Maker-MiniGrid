( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b995 - block
    b662 - block
    b379 - block
    b782 - block
    b455 - block
    b986 - block
    b377 - block
    b231 - block
    b697 - block
    b256 - block
    b369 - block
    b486 - block
    b968 - block
    b533 - block
    b320 - block
    b876 - block
    b764 - block
    b370 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b995 )
    ( on b662 b995 )
    ( on b379 b662 )
    ( on b782 b379 )
    ( on b455 b782 )
    ( on b986 b455 )
    ( on b377 b986 )
    ( on b231 b377 )
    ( on b697 b231 )
    ( on b256 b697 )
    ( on b369 b256 )
    ( on b486 b369 )
    ( on b968 b486 )
    ( on b533 b968 )
    ( on b320 b533 )
    ( on b876 b320 )
    ( on b764 b876 )
    ( on b370 b764 )
    ( clear b370 )
  )
  ( :goal
    ( and
      ( clear b995 )
    )
  )
)
