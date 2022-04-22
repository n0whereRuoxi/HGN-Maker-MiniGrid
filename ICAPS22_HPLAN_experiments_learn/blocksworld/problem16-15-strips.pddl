( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b852 - block
    b254 - block
    b539 - block
    b391 - block
    b558 - block
    b479 - block
    b137 - block
    b10 - block
    b728 - block
    b270 - block
    b491 - block
    b50 - block
    b308 - block
    b594 - block
    b401 - block
    b489 - block
    b124 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b852 )
    ( on b254 b852 )
    ( on b539 b254 )
    ( on b391 b539 )
    ( on b558 b391 )
    ( on b479 b558 )
    ( on b137 b479 )
    ( on b10 b137 )
    ( on b728 b10 )
    ( on b270 b728 )
    ( on b491 b270 )
    ( on b50 b491 )
    ( on b308 b50 )
    ( on b594 b308 )
    ( on b401 b594 )
    ( on b489 b401 )
    ( on b124 b489 )
    ( clear b124 )
  )
  ( :goal
    ( and
      ( clear b852 )
    )
  )
)
