( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b336 - block
    b809 - block
    b966 - block
    b250 - block
    b555 - block
    b78 - block
    b687 - block
    b694 - block
    b549 - block
    b178 - block
    b615 - block
    b584 - block
    b771 - block
    b967 - block
    b363 - block
    b921 - block
    b276 - block
    b9 - block
    b270 - block
    b366 - block
    b557 - block
    b392 - block
    b919 - block
    b371 - block
    b621 - block
    b677 - block
    b511 - block
    b477 - block
    b857 - block
    b515 - block
    b120 - block
    b431 - block
    b938 - block
    b141 - block
    b351 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b336 )
    ( on b809 b336 )
    ( on b966 b809 )
    ( on b250 b966 )
    ( on b555 b250 )
    ( on b78 b555 )
    ( on b687 b78 )
    ( on b694 b687 )
    ( on b549 b694 )
    ( on b178 b549 )
    ( on b615 b178 )
    ( on b584 b615 )
    ( on b771 b584 )
    ( on b967 b771 )
    ( on b363 b967 )
    ( on b921 b363 )
    ( on b276 b921 )
    ( on b9 b276 )
    ( on b270 b9 )
    ( on b366 b270 )
    ( on b557 b366 )
    ( on b392 b557 )
    ( on b919 b392 )
    ( on b371 b919 )
    ( on b621 b371 )
    ( on b677 b621 )
    ( on b511 b677 )
    ( on b477 b511 )
    ( on b857 b477 )
    ( on b515 b857 )
    ( on b120 b515 )
    ( on b431 b120 )
    ( on b938 b431 )
    ( on b141 b938 )
    ( on b351 b141 )
    ( clear b351 )
  )
  ( :goal
    ( and
      ( clear b336 )
    )
  )
)
