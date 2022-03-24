( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b193 - block
    b876 - block
    b89 - block
    b425 - block
    b531 - block
    b398 - block
    b826 - block
    b426 - block
    b276 - block
    b678 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b193 )
    ( on b876 b193 )
    ( on b89 b876 )
    ( on b425 b89 )
    ( on b531 b425 )
    ( on b398 b531 )
    ( on b826 b398 )
    ( on b426 b826 )
    ( on b276 b426 )
    ( on b678 b276 )
    ( clear b678 )
  )
  ( :tasks
    ( Make-9Pile b876 b89 b425 b531 b398 b826 b426 b276 b678 )
  )
)
