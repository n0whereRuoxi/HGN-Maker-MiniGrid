( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b800 - block
    b677 - block
    b409 - block
    b970 - block
    b126 - block
    b828 - block
    b518 - block
    b857 - block
    b501 - block
    b955 - block
    b479 - block
    b850 - block
    b683 - block
    b679 - block
    b46 - block
    b523 - block
    b728 - block
    b136 - block
    b179 - block
    b564 - block
    b711 - block
    b191 - block
    b111 - block
    b378 - block
    b429 - block
    b740 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b800 )
    ( on b677 b800 )
    ( on b409 b677 )
    ( on b970 b409 )
    ( on b126 b970 )
    ( on b828 b126 )
    ( on b518 b828 )
    ( on b857 b518 )
    ( on b501 b857 )
    ( on b955 b501 )
    ( on b479 b955 )
    ( on b850 b479 )
    ( on b683 b850 )
    ( on b679 b683 )
    ( on b46 b679 )
    ( on b523 b46 )
    ( on b728 b523 )
    ( on b136 b728 )
    ( on b179 b136 )
    ( on b564 b179 )
    ( on b711 b564 )
    ( on b191 b711 )
    ( on b111 b191 )
    ( on b378 b111 )
    ( on b429 b378 )
    ( on b740 b429 )
    ( clear b740 )
  )
  ( :goal
    ( and
      ( clear b800 )
    )
  )
)
