( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b914 - block
    b9 - block
    b859 - block
    b773 - block
    b897 - block
    b455 - block
    b987 - block
    b441 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b914 )
    ( on b9 b914 )
    ( on b859 b9 )
    ( on b773 b859 )
    ( on b897 b773 )
    ( on b455 b897 )
    ( on b987 b455 )
    ( on b441 b987 )
    ( clear b441 )
  )
  ( :goal
    ( and
      ( clear b914 )
    )
  )
)
