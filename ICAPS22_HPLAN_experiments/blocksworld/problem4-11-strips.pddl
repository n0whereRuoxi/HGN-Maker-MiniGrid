( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b128 - block
    b328 - block
    b827 - block
    b122 - block
    b436 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b128 )
    ( on b328 b128 )
    ( on b827 b328 )
    ( on b122 b827 )
    ( on b436 b122 )
    ( clear b436 )
  )
  ( :goal
    ( and
      ( clear b128 )
    )
  )
)
