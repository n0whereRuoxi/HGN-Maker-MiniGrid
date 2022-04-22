( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b122 - block
    b278 - block
    b529 - block
    b104 - block
    b431 - block
    b98 - block
    b926 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b122 )
    ( on b278 b122 )
    ( on b529 b278 )
    ( on b104 b529 )
    ( on b431 b104 )
    ( on b98 b431 )
    ( on b926 b98 )
    ( clear b926 )
  )
  ( :goal
    ( and
      ( clear b122 )
    )
  )
)
