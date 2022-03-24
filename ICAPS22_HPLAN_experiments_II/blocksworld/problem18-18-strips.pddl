( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b202 - block
    b147 - block
    b68 - block
    b988 - block
    b316 - block
    b875 - block
    b524 - block
    b786 - block
    b23 - block
    b771 - block
    b25 - block
    b276 - block
    b538 - block
    b281 - block
    b777 - block
    b426 - block
    b510 - block
    b514 - block
    b494 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b202 )
    ( on b147 b202 )
    ( on b68 b147 )
    ( on b988 b68 )
    ( on b316 b988 )
    ( on b875 b316 )
    ( on b524 b875 )
    ( on b786 b524 )
    ( on b23 b786 )
    ( on b771 b23 )
    ( on b25 b771 )
    ( on b276 b25 )
    ( on b538 b276 )
    ( on b281 b538 )
    ( on b777 b281 )
    ( on b426 b777 )
    ( on b510 b426 )
    ( on b514 b510 )
    ( on b494 b514 )
    ( clear b494 )
  )
  ( :goal
    ( and
      ( clear b202 )
    )
  )
)
