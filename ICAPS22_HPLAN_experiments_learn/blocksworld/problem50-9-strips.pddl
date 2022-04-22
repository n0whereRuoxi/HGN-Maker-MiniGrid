( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b325 - block
    b395 - block
    b5 - block
    b113 - block
    b669 - block
    b129 - block
    b631 - block
    b937 - block
    b126 - block
    b615 - block
    b329 - block
    b147 - block
    b561 - block
    b660 - block
    b407 - block
    b327 - block
    b199 - block
    b94 - block
    b312 - block
    b473 - block
    b956 - block
    b486 - block
    b419 - block
    b813 - block
    b413 - block
    b171 - block
    b343 - block
    b83 - block
    b807 - block
    b35 - block
    b571 - block
    b688 - block
    b428 - block
    b652 - block
    b356 - block
    b422 - block
    b274 - block
    b52 - block
    b169 - block
    b435 - block
    b586 - block
    b510 - block
    b385 - block
    b117 - block
    b683 - block
    b364 - block
    b603 - block
    b444 - block
    b104 - block
    b662 - block
    b842 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b325 )
    ( on b395 b325 )
    ( on b5 b395 )
    ( on b113 b5 )
    ( on b669 b113 )
    ( on b129 b669 )
    ( on b631 b129 )
    ( on b937 b631 )
    ( on b126 b937 )
    ( on b615 b126 )
    ( on b329 b615 )
    ( on b147 b329 )
    ( on b561 b147 )
    ( on b660 b561 )
    ( on b407 b660 )
    ( on b327 b407 )
    ( on b199 b327 )
    ( on b94 b199 )
    ( on b312 b94 )
    ( on b473 b312 )
    ( on b956 b473 )
    ( on b486 b956 )
    ( on b419 b486 )
    ( on b813 b419 )
    ( on b413 b813 )
    ( on b171 b413 )
    ( on b343 b171 )
    ( on b83 b343 )
    ( on b807 b83 )
    ( on b35 b807 )
    ( on b571 b35 )
    ( on b688 b571 )
    ( on b428 b688 )
    ( on b652 b428 )
    ( on b356 b652 )
    ( on b422 b356 )
    ( on b274 b422 )
    ( on b52 b274 )
    ( on b169 b52 )
    ( on b435 b169 )
    ( on b586 b435 )
    ( on b510 b586 )
    ( on b385 b510 )
    ( on b117 b385 )
    ( on b683 b117 )
    ( on b364 b683 )
    ( on b603 b364 )
    ( on b444 b603 )
    ( on b104 b444 )
    ( on b662 b104 )
    ( on b842 b662 )
    ( clear b842 )
  )
  ( :goal
    ( and
      ( clear b325 )
    )
  )
)
