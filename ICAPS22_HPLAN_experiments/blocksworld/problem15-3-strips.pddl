( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b467 - block
    b17 - block
    b463 - block
    b7 - block
    b658 - block
    b959 - block
    b405 - block
    b108 - block
    b921 - block
    b763 - block
    b233 - block
    b554 - block
    b865 - block
    b416 - block
    b954 - block
    b797 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b467 )
    ( on b17 b467 )
    ( on b463 b17 )
    ( on b7 b463 )
    ( on b658 b7 )
    ( on b959 b658 )
    ( on b405 b959 )
    ( on b108 b405 )
    ( on b921 b108 )
    ( on b763 b921 )
    ( on b233 b763 )
    ( on b554 b233 )
    ( on b865 b554 )
    ( on b416 b865 )
    ( on b954 b416 )
    ( on b797 b954 )
    ( clear b797 )
  )
  ( :goal
    ( and
      ( clear b467 )
    )
  )
)
