( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b679 - block
    b617 - block
    b865 - block
    b222 - block
    b461 - block
    b644 - block
    b938 - block
    b629 - block
    b690 - block
    b510 - block
    b174 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b679 )
    ( on b617 b679 )
    ( on b865 b617 )
    ( on b222 b865 )
    ( on b461 b222 )
    ( on b644 b461 )
    ( on b938 b644 )
    ( on b629 b938 )
    ( on b690 b629 )
    ( on b510 b690 )
    ( on b174 b510 )
    ( clear b174 )
  )
  ( :goal
    ( and
      ( clear b679 )
    )
  )
)
