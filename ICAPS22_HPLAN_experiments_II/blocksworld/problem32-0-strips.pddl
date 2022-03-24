( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b140 - block
    b125 - block
    b262 - block
    b504 - block
    b457 - block
    b610 - block
    b362 - block
    b358 - block
    b77 - block
    b482 - block
    b72 - block
    b337 - block
    b522 - block
    b856 - block
    b757 - block
    b733 - block
    b408 - block
    b929 - block
    b867 - block
    b783 - block
    b420 - block
    b418 - block
    b471 - block
    b840 - block
    b845 - block
    b122 - block
    b980 - block
    b864 - block
    b275 - block
    b657 - block
    b369 - block
    b213 - block
    b364 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b140 )
    ( on b125 b140 )
    ( on b262 b125 )
    ( on b504 b262 )
    ( on b457 b504 )
    ( on b610 b457 )
    ( on b362 b610 )
    ( on b358 b362 )
    ( on b77 b358 )
    ( on b482 b77 )
    ( on b72 b482 )
    ( on b337 b72 )
    ( on b522 b337 )
    ( on b856 b522 )
    ( on b757 b856 )
    ( on b733 b757 )
    ( on b408 b733 )
    ( on b929 b408 )
    ( on b867 b929 )
    ( on b783 b867 )
    ( on b420 b783 )
    ( on b418 b420 )
    ( on b471 b418 )
    ( on b840 b471 )
    ( on b845 b840 )
    ( on b122 b845 )
    ( on b980 b122 )
    ( on b864 b980 )
    ( on b275 b864 )
    ( on b657 b275 )
    ( on b369 b657 )
    ( on b213 b369 )
    ( on b364 b213 )
    ( clear b364 )
  )
  ( :goal
    ( and
      ( clear b140 )
    )
  )
)
