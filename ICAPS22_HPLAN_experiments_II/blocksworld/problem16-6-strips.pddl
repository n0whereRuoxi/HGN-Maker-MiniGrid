( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b420 - block
    b838 - block
    b568 - block
    b249 - block
    b637 - block
    b797 - block
    b416 - block
    b255 - block
    b499 - block
    b23 - block
    b865 - block
    b650 - block
    b759 - block
    b158 - block
    b75 - block
    b559 - block
    b489 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b420 )
    ( on b838 b420 )
    ( on b568 b838 )
    ( on b249 b568 )
    ( on b637 b249 )
    ( on b797 b637 )
    ( on b416 b797 )
    ( on b255 b416 )
    ( on b499 b255 )
    ( on b23 b499 )
    ( on b865 b23 )
    ( on b650 b865 )
    ( on b759 b650 )
    ( on b158 b759 )
    ( on b75 b158 )
    ( on b559 b75 )
    ( on b489 b559 )
    ( clear b489 )
  )
  ( :goal
    ( and
      ( clear b420 )
    )
  )
)
