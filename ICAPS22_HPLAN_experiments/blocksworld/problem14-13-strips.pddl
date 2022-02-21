( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b38 - block
    b539 - block
    b478 - block
    b164 - block
    b657 - block
    b972 - block
    b763 - block
    b549 - block
    b467 - block
    b801 - block
    b82 - block
    b386 - block
    b586 - block
    b995 - block
    b929 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b38 )
    ( on b539 b38 )
    ( on b478 b539 )
    ( on b164 b478 )
    ( on b657 b164 )
    ( on b972 b657 )
    ( on b763 b972 )
    ( on b549 b763 )
    ( on b467 b549 )
    ( on b801 b467 )
    ( on b82 b801 )
    ( on b386 b82 )
    ( on b586 b386 )
    ( on b995 b586 )
    ( on b929 b995 )
    ( clear b929 )
  )
  ( :goal
    ( and
      ( clear b38 )
    )
  )
)
