( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b969 - block
    b837 - block
    b234 - block
    b491 - block
    b335 - block
    b25 - block
    b31 - block
    b315 - block
    b531 - block
    b813 - block
    b838 - block
    b554 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b969 )
    ( on b837 b969 )
    ( on b234 b837 )
    ( on b491 b234 )
    ( on b335 b491 )
    ( on b25 b335 )
    ( on b31 b25 )
    ( on b315 b31 )
    ( on b531 b315 )
    ( on b813 b531 )
    ( on b838 b813 )
    ( on b554 b838 )
    ( clear b554 )
  )
  ( :goal
    ( and
      ( clear b969 )
    )
  )
)
