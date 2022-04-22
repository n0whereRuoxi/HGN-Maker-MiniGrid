( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b733 - block
    b564 - block
    b408 - block
    b747 - block
    b631 - block
    b858 - block
    b483 - block
    b63 - block
    b41 - block
    b816 - block
    b785 - block
    b761 - block
    b996 - block
    b447 - block
    b827 - block
    b18 - block
    b378 - block
    b853 - block
    b341 - block
    b190 - block
    b404 - block
    b397 - block
    b54 - block
    b905 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b733 )
    ( on b564 b733 )
    ( on b408 b564 )
    ( on b747 b408 )
    ( on b631 b747 )
    ( on b858 b631 )
    ( on b483 b858 )
    ( on b63 b483 )
    ( on b41 b63 )
    ( on b816 b41 )
    ( on b785 b816 )
    ( on b761 b785 )
    ( on b996 b761 )
    ( on b447 b996 )
    ( on b827 b447 )
    ( on b18 b827 )
    ( on b378 b18 )
    ( on b853 b378 )
    ( on b341 b853 )
    ( on b190 b341 )
    ( on b404 b190 )
    ( on b397 b404 )
    ( on b54 b397 )
    ( on b905 b54 )
    ( clear b905 )
  )
  ( :goal
    ( and
      ( clear b733 )
    )
  )
)
