( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b963 - block
    b375 - block
    b122 - block
    b196 - block
    b500 - block
    b586 - block
    b150 - block
    b232 - block
    b447 - block
    b387 - block
    b624 - block
    b628 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b963 )
    ( on b375 b963 )
    ( on b122 b375 )
    ( on b196 b122 )
    ( on b500 b196 )
    ( on b586 b500 )
    ( on b150 b586 )
    ( on b232 b150 )
    ( on b447 b232 )
    ( on b387 b447 )
    ( on b624 b387 )
    ( on b628 b624 )
    ( clear b628 )
  )
  ( :goal
    ( and
      ( clear b963 )
    )
  )
)
