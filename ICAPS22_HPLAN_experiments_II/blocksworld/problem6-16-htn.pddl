( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b618 - block
    b436 - block
    b630 - block
    b418 - block
    b351 - block
    b429 - block
    b299 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b618 )
    ( on b436 b618 )
    ( on b630 b436 )
    ( on b418 b630 )
    ( on b351 b418 )
    ( on b429 b351 )
    ( on b299 b429 )
    ( clear b299 )
  )
  ( :tasks
    ( Make-6Pile b436 b630 b418 b351 b429 b299 )
  )
)
