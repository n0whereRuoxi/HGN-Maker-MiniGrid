( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b598 - block
    b989 - block
    b92 - block
    b156 - block
    b347 - block
    b967 - block
    b316 - block
    b857 - block
    b304 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b598 )
    ( on b989 b598 )
    ( on b92 b989 )
    ( on b156 b92 )
    ( on b347 b156 )
    ( on b967 b347 )
    ( on b316 b967 )
    ( on b857 b316 )
    ( on b304 b857 )
    ( clear b304 )
  )
  ( :goal
    ( and
      ( clear b598 )
    )
  )
)
