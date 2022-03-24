( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b908 - block
    b3 - block
    b363 - block
    b632 - block
    b982 - block
    b296 - block
    b217 - block
    b313 - block
    b195 - block
    b805 - block
    b61 - block
    b490 - block
    b586 - block
    b625 - block
    b126 - block
    b645 - block
    b703 - block
    b598 - block
    b999 - block
    b920 - block
    b33 - block
    b555 - block
    b784 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b908 )
    ( on b3 b908 )
    ( on b363 b3 )
    ( on b632 b363 )
    ( on b982 b632 )
    ( on b296 b982 )
    ( on b217 b296 )
    ( on b313 b217 )
    ( on b195 b313 )
    ( on b805 b195 )
    ( on b61 b805 )
    ( on b490 b61 )
    ( on b586 b490 )
    ( on b625 b586 )
    ( on b126 b625 )
    ( on b645 b126 )
    ( on b703 b645 )
    ( on b598 b703 )
    ( on b999 b598 )
    ( on b920 b999 )
    ( on b33 b920 )
    ( on b555 b33 )
    ( on b784 b555 )
    ( clear b784 )
  )
  ( :goal
    ( and
      ( clear b908 )
    )
  )
)
