( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b14 - block
    b300 - block
    b75 - block
    b118 - block
    b519 - block
    b217 - block
    b100 - block
    b514 - block
    b711 - block
    b46 - block
    b472 - block
    b798 - block
    b794 - block
    b1 - block
    b701 - block
    b907 - block
    b842 - block
    b957 - block
    b558 - block
    b399 - block
    b834 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b14 )
    ( on b300 b14 )
    ( on b75 b300 )
    ( on b118 b75 )
    ( on b519 b118 )
    ( on b217 b519 )
    ( on b100 b217 )
    ( on b514 b100 )
    ( on b711 b514 )
    ( on b46 b711 )
    ( on b472 b46 )
    ( on b798 b472 )
    ( on b794 b798 )
    ( on b1 b794 )
    ( on b701 b1 )
    ( on b907 b701 )
    ( on b842 b907 )
    ( on b957 b842 )
    ( on b558 b957 )
    ( on b399 b558 )
    ( on b834 b399 )
    ( clear b834 )
  )
  ( :goal
    ( and
      ( clear b14 )
    )
  )
)
