( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b607 - block
    b394 - block
    b473 - block
    b701 - block
    b380 - block
    b758 - block
    b810 - block
    b157 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b607 )
    ( on b394 b607 )
    ( on b473 b394 )
    ( on b701 b473 )
    ( on b380 b701 )
    ( on b758 b380 )
    ( on b810 b758 )
    ( on b157 b810 )
    ( clear b157 )
  )
  ( :goal
    ( and
      ( clear b607 )
    )
  )
)
