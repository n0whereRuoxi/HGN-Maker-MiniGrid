( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b604 - block
    b958 - block
    b978 - block
    b174 - block
    b361 - block
    b411 - block
    b675 - block
    b70 - block
    b165 - block
    b520 - block
    b781 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b604 b424 )
    ( on b958 b604 )
    ( on b978 b958 )
    ( on b174 b978 )
    ( on b361 b174 )
    ( on b411 b361 )
    ( on b675 b411 )
    ( on b70 b675 )
    ( on b165 b70 )
    ( on b520 b165 )
    ( on b781 b520 )
    ( clear b781 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
