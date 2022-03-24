( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b486 - block
    b299 - block
    b22 - block
    b549 - block
    b2 - block
    b707 - block
    b268 - block
    b444 - block
    b429 - block
    b822 - block
    b150 - block
    b609 - block
    b166 - block
    b800 - block
    b308 - block
    b96 - block
    b233 - block
    b543 - block
    b123 - block
    b210 - block
    b709 - block
    b14 - block
    b390 - block
    b425 - block
    b589 - block
    b40 - block
    b760 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b486 )
    ( on b299 b486 )
    ( on b22 b299 )
    ( on b549 b22 )
    ( on b2 b549 )
    ( on b707 b2 )
    ( on b268 b707 )
    ( on b444 b268 )
    ( on b429 b444 )
    ( on b822 b429 )
    ( on b150 b822 )
    ( on b609 b150 )
    ( on b166 b609 )
    ( on b800 b166 )
    ( on b308 b800 )
    ( on b96 b308 )
    ( on b233 b96 )
    ( on b543 b233 )
    ( on b123 b543 )
    ( on b210 b123 )
    ( on b709 b210 )
    ( on b14 b709 )
    ( on b390 b14 )
    ( on b425 b390 )
    ( on b589 b425 )
    ( on b40 b589 )
    ( on b760 b40 )
    ( clear b760 )
  )
  ( :goal
    ( and
      ( clear b486 )
    )
  )
)
