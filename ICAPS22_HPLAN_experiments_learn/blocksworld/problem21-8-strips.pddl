( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b836 - block
    b21 - block
    b81 - block
    b971 - block
    b812 - block
    b418 - block
    b467 - block
    b330 - block
    b44 - block
    b582 - block
    b180 - block
    b909 - block
    b313 - block
    b669 - block
    b47 - block
    b671 - block
    b473 - block
    b4 - block
    b623 - block
    b922 - block
    b857 - block
    b475 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b836 )
    ( on b21 b836 )
    ( on b81 b21 )
    ( on b971 b81 )
    ( on b812 b971 )
    ( on b418 b812 )
    ( on b467 b418 )
    ( on b330 b467 )
    ( on b44 b330 )
    ( on b582 b44 )
    ( on b180 b582 )
    ( on b909 b180 )
    ( on b313 b909 )
    ( on b669 b313 )
    ( on b47 b669 )
    ( on b671 b47 )
    ( on b473 b671 )
    ( on b4 b473 )
    ( on b623 b4 )
    ( on b922 b623 )
    ( on b857 b922 )
    ( on b475 b857 )
    ( clear b475 )
  )
  ( :goal
    ( and
      ( clear b836 )
    )
  )
)
