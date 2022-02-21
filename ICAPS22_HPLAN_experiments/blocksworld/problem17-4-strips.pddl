( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b213 - block
    b832 - block
    b830 - block
    b834 - block
    b487 - block
    b768 - block
    b537 - block
    b988 - block
    b971 - block
    b948 - block
    b722 - block
    b535 - block
    b47 - block
    b552 - block
    b376 - block
    b86 - block
    b415 - block
    b814 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b213 )
    ( on b832 b213 )
    ( on b830 b832 )
    ( on b834 b830 )
    ( on b487 b834 )
    ( on b768 b487 )
    ( on b537 b768 )
    ( on b988 b537 )
    ( on b971 b988 )
    ( on b948 b971 )
    ( on b722 b948 )
    ( on b535 b722 )
    ( on b47 b535 )
    ( on b552 b47 )
    ( on b376 b552 )
    ( on b86 b376 )
    ( on b415 b86 )
    ( on b814 b415 )
    ( clear b814 )
  )
  ( :goal
    ( and
      ( clear b213 )
    )
  )
)
