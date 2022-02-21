( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b67 - block
    b777 - block
    b373 - block
    b719 - block
    b163 - block
    b32 - block
    b926 - block
    b248 - block
    b60 - block
    b984 - block
    b408 - block
    b246 - block
    b928 - block
    b626 - block
    b642 - block
    b424 - block
    b723 - block
    b333 - block
    b969 - block
    b535 - block
    b299 - block
    b623 - block
    b500 - block
    b827 - block
    b967 - block
    b536 - block
    b876 - block
    b622 - block
    b595 - block
    b236 - block
    b661 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b67 )
    ( on b777 b67 )
    ( on b373 b777 )
    ( on b719 b373 )
    ( on b163 b719 )
    ( on b32 b163 )
    ( on b926 b32 )
    ( on b248 b926 )
    ( on b60 b248 )
    ( on b984 b60 )
    ( on b408 b984 )
    ( on b246 b408 )
    ( on b928 b246 )
    ( on b626 b928 )
    ( on b642 b626 )
    ( on b424 b642 )
    ( on b723 b424 )
    ( on b333 b723 )
    ( on b969 b333 )
    ( on b535 b969 )
    ( on b299 b535 )
    ( on b623 b299 )
    ( on b500 b623 )
    ( on b827 b500 )
    ( on b967 b827 )
    ( on b536 b967 )
    ( on b876 b536 )
    ( on b622 b876 )
    ( on b595 b622 )
    ( on b236 b595 )
    ( on b661 b236 )
    ( clear b661 )
  )
  ( :goal
    ( and
      ( clear b67 )
    )
  )
)
