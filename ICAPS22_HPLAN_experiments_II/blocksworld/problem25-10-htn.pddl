( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b948 - block
    b920 - block
    b876 - block
    b996 - block
    b821 - block
    b970 - block
    b226 - block
    b887 - block
    b208 - block
    b625 - block
    b803 - block
    b505 - block
    b239 - block
    b770 - block
    b705 - block
    b568 - block
    b181 - block
    b594 - block
    b558 - block
    b266 - block
    b439 - block
    b227 - block
    b172 - block
    b238 - block
    b35 - block
    b698 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b948 )
    ( on b920 b948 )
    ( on b876 b920 )
    ( on b996 b876 )
    ( on b821 b996 )
    ( on b970 b821 )
    ( on b226 b970 )
    ( on b887 b226 )
    ( on b208 b887 )
    ( on b625 b208 )
    ( on b803 b625 )
    ( on b505 b803 )
    ( on b239 b505 )
    ( on b770 b239 )
    ( on b705 b770 )
    ( on b568 b705 )
    ( on b181 b568 )
    ( on b594 b181 )
    ( on b558 b594 )
    ( on b266 b558 )
    ( on b439 b266 )
    ( on b227 b439 )
    ( on b172 b227 )
    ( on b238 b172 )
    ( on b35 b238 )
    ( on b698 b35 )
    ( clear b698 )
  )
  ( :tasks
    ( Make-25Pile b920 b876 b996 b821 b970 b226 b887 b208 b625 b803 b505 b239 b770 b705 b568 b181 b594 b558 b266 b439 b227 b172 b238 b35 b698 )
  )
)
