( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b175 - block
    b519 - block
    b785 - block
    b929 - block
    b43 - block
    b975 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b175 )
    ( on b519 b175 )
    ( on b785 b519 )
    ( on b929 b785 )
    ( on b43 b929 )
    ( on b975 b43 )
    ( clear b975 )
  )
  ( :goal
    ( and
      ( clear b175 )
    )
  )
)
