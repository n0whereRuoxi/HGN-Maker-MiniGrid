( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b364 - block
    b204 - block
    b455 - block
    b382 - block
    b352 - block
    b469 - block
    b987 - block
    b105 - block
    b801 - block
    b550 - block
    b899 - block
    b575 - block
    b39 - block
    b491 - block
    b867 - block
    b905 - block
    b580 - block
    b829 - block
    b305 - block
    b189 - block
    b626 - block
    b617 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b364 )
    ( on b204 b364 )
    ( on b455 b204 )
    ( on b382 b455 )
    ( on b352 b382 )
    ( on b469 b352 )
    ( on b987 b469 )
    ( on b105 b987 )
    ( on b801 b105 )
    ( on b550 b801 )
    ( on b899 b550 )
    ( on b575 b899 )
    ( on b39 b575 )
    ( on b491 b39 )
    ( on b867 b491 )
    ( on b905 b867 )
    ( on b580 b905 )
    ( on b829 b580 )
    ( on b305 b829 )
    ( on b189 b305 )
    ( on b626 b189 )
    ( on b617 b626 )
    ( clear b617 )
  )
  ( :tasks
    ( Make-21Pile b204 b455 b382 b352 b469 b987 b105 b801 b550 b899 b575 b39 b491 b867 b905 b580 b829 b305 b189 b626 b617 )
  )
)
