( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b367 - block
    b418 - block
    b210 - block
    b838 - block
    b594 - block
    b503 - block
    b709 - block
    b262 - block
    b729 - block
    b490 - block
    b419 - block
    b203 - block
    b988 - block
    b672 - block
    b360 - block
    b945 - block
    b918 - block
    b508 - block
    b369 - block
    b885 - block
    b379 - block
    b205 - block
    b868 - block
    b146 - block
    b832 - block
    b651 - block
    b912 - block
    b41 - block
    b488 - block
    b857 - block
    b642 - block
    b93 - block
    b921 - block
    b858 - block
    b830 - block
    b568 - block
    b185 - block
    b334 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b367 )
    ( on b418 b367 )
    ( on b210 b418 )
    ( on b838 b210 )
    ( on b594 b838 )
    ( on b503 b594 )
    ( on b709 b503 )
    ( on b262 b709 )
    ( on b729 b262 )
    ( on b490 b729 )
    ( on b419 b490 )
    ( on b203 b419 )
    ( on b988 b203 )
    ( on b672 b988 )
    ( on b360 b672 )
    ( on b945 b360 )
    ( on b918 b945 )
    ( on b508 b918 )
    ( on b369 b508 )
    ( on b885 b369 )
    ( on b379 b885 )
    ( on b205 b379 )
    ( on b868 b205 )
    ( on b146 b868 )
    ( on b832 b146 )
    ( on b651 b832 )
    ( on b912 b651 )
    ( on b41 b912 )
    ( on b488 b41 )
    ( on b857 b488 )
    ( on b642 b857 )
    ( on b93 b642 )
    ( on b921 b93 )
    ( on b858 b921 )
    ( on b830 b858 )
    ( on b568 b830 )
    ( on b185 b568 )
    ( on b334 b185 )
    ( clear b334 )
  )
  ( :goal
    ( and
      ( clear b367 )
    )
  )
)
