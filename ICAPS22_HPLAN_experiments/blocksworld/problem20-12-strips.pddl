( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b324 - block
    b575 - block
    b781 - block
    b188 - block
    b74 - block
    b810 - block
    b952 - block
    b559 - block
    b111 - block
    b506 - block
    b697 - block
    b468 - block
    b316 - block
    b358 - block
    b910 - block
    b531 - block
    b960 - block
    b519 - block
    b839 - block
    b490 - block
    b369 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b324 )
    ( on b575 b324 )
    ( on b781 b575 )
    ( on b188 b781 )
    ( on b74 b188 )
    ( on b810 b74 )
    ( on b952 b810 )
    ( on b559 b952 )
    ( on b111 b559 )
    ( on b506 b111 )
    ( on b697 b506 )
    ( on b468 b697 )
    ( on b316 b468 )
    ( on b358 b316 )
    ( on b910 b358 )
    ( on b531 b910 )
    ( on b960 b531 )
    ( on b519 b960 )
    ( on b839 b519 )
    ( on b490 b839 )
    ( on b369 b490 )
    ( clear b369 )
  )
  ( :goal
    ( and
      ( clear b324 )
    )
  )
)
