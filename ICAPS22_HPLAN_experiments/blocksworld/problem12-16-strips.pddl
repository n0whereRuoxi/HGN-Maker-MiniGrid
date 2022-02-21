( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b436 - block
    b380 - block
    b47 - block
    b144 - block
    b802 - block
    b429 - block
    b151 - block
    b141 - block
    b467 - block
    b228 - block
    b473 - block
    b306 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b436 )
    ( on b380 b436 )
    ( on b47 b380 )
    ( on b144 b47 )
    ( on b802 b144 )
    ( on b429 b802 )
    ( on b151 b429 )
    ( on b141 b151 )
    ( on b467 b141 )
    ( on b228 b467 )
    ( on b473 b228 )
    ( on b306 b473 )
    ( on b381 b306 )
    ( clear b381 )
  )
  ( :goal
    ( and
      ( clear b436 )
    )
  )
)
