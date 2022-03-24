( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b663 - block
    b651 - block
    b574 - block
    b369 - block
    b884 - block
    b490 - block
    b556 - block
    b77 - block
    b990 - block
    b774 - block
    b480 - block
    b594 - block
    b51 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b663 )
    ( on b651 b663 )
    ( on b574 b651 )
    ( on b369 b574 )
    ( on b884 b369 )
    ( on b490 b884 )
    ( on b556 b490 )
    ( on b77 b556 )
    ( on b990 b77 )
    ( on b774 b990 )
    ( on b480 b774 )
    ( on b594 b480 )
    ( on b51 b594 )
    ( clear b51 )
  )
  ( :goal
    ( and
      ( clear b663 )
    )
  )
)
