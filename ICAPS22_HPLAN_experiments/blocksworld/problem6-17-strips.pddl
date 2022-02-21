( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b526 - block
    b513 - block
    b47 - block
    b493 - block
    b793 - block
    b215 - block
    b837 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b526 )
    ( on b513 b526 )
    ( on b47 b513 )
    ( on b493 b47 )
    ( on b793 b493 )
    ( on b215 b793 )
    ( on b837 b215 )
    ( clear b837 )
  )
  ( :goal
    ( and
      ( clear b526 )
      ( clear b526 )
      ( clear b526 )
      ( clear b526 )
      ( clear b526 )
      ( clear b526 )
      ( clear b526 )
    )
  )
)
