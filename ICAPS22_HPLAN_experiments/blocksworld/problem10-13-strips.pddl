( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b533 - block
    b747 - block
    b122 - block
    b420 - block
    b676 - block
    b104 - block
    b663 - block
    b314 - block
    b219 - block
    b36 - block
    b942 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b533 )
    ( on b747 b533 )
    ( on b122 b747 )
    ( on b420 b122 )
    ( on b676 b420 )
    ( on b104 b676 )
    ( on b663 b104 )
    ( on b314 b663 )
    ( on b219 b314 )
    ( on b36 b219 )
    ( on b942 b36 )
    ( clear b942 )
  )
  ( :goal
    ( and
      ( clear b533 )
    )
  )
)
