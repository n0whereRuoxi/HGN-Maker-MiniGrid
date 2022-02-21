( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b749 - block
    b639 - block
    b100 - block
    b515 - block
    b985 - block
    b646 - block
    b585 - block
    b584 - block
    b580 - block
    b592 - block
    b523 - block
    b782 - block
    b469 - block
    b860 - block
    b533 - block
    b792 - block
    b94 - block
    b485 - block
    b371 - block
    b743 - block
    b510 - block
    b409 - block
    b80 - block
    b705 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b749 )
    ( on b639 b749 )
    ( on b100 b639 )
    ( on b515 b100 )
    ( on b985 b515 )
    ( on b646 b985 )
    ( on b585 b646 )
    ( on b584 b585 )
    ( on b580 b584 )
    ( on b592 b580 )
    ( on b523 b592 )
    ( on b782 b523 )
    ( on b469 b782 )
    ( on b860 b469 )
    ( on b533 b860 )
    ( on b792 b533 )
    ( on b94 b792 )
    ( on b485 b94 )
    ( on b371 b485 )
    ( on b743 b371 )
    ( on b510 b743 )
    ( on b409 b510 )
    ( on b80 b409 )
    ( on b705 b80 )
    ( clear b705 )
  )
  ( :goal
    ( and
      ( clear b749 )
    )
  )
)
