( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b632 - block
    b53 - block
    b380 - block
    b12 - block
    b828 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b632 )
    ( on b53 b632 )
    ( on b380 b53 )
    ( on b12 b380 )
    ( on b828 b12 )
    ( clear b828 )
  )
  ( :goal
    ( and
      ( clear b632 )
    )
  )
)
