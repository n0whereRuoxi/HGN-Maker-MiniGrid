( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b277 - block
    b78 - block
    b883 - block
    b260 - block
    b32 - block
    b840 - block
    b606 - block
    b480 - block
    b41 - block
    b713 - block
    b727 - block
    b605 - block
    b699 - block
    b987 - block
    b588 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b277 )
    ( on b78 b277 )
    ( on b883 b78 )
    ( on b260 b883 )
    ( on b32 b260 )
    ( on b840 b32 )
    ( on b606 b840 )
    ( on b480 b606 )
    ( on b41 b480 )
    ( on b713 b41 )
    ( on b727 b713 )
    ( on b605 b727 )
    ( on b699 b605 )
    ( on b987 b699 )
    ( on b588 b987 )
    ( clear b588 )
  )
  ( :tasks
    ( Make-14Pile b78 b883 b260 b32 b840 b606 b480 b41 b713 b727 b605 b699 b987 b588 )
  )
)
