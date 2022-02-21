( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b233 - block
    b436 - block
    b590 - block
    b774 - block
    b478 - block
    b190 - block
    b311 - block
    b32 - block
    b619 - block
    b171 - block
    b199 - block
    b258 - block
    b413 - block
    b580 - block
    b134 - block
    b467 - block
    b372 - block
    b924 - block
    b318 - block
    b355 - block
    b130 - block
    b886 - block
    b503 - block
    b27 - block
    b215 - block
    b201 - block
    b942 - block
    b324 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b233 )
    ( on b436 b233 )
    ( on b590 b436 )
    ( on b774 b590 )
    ( on b478 b774 )
    ( on b190 b478 )
    ( on b311 b190 )
    ( on b32 b311 )
    ( on b619 b32 )
    ( on b171 b619 )
    ( on b199 b171 )
    ( on b258 b199 )
    ( on b413 b258 )
    ( on b580 b413 )
    ( on b134 b580 )
    ( on b467 b134 )
    ( on b372 b467 )
    ( on b924 b372 )
    ( on b318 b924 )
    ( on b355 b318 )
    ( on b130 b355 )
    ( on b886 b130 )
    ( on b503 b886 )
    ( on b27 b503 )
    ( on b215 b27 )
    ( on b201 b215 )
    ( on b942 b201 )
    ( on b324 b942 )
    ( clear b324 )
  )
  ( :goal
    ( and
      ( clear b233 )
    )
  )
)
