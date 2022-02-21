( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b512 - block
    b473 - block
    b485 - block
    b541 - block
    b42 - block
    b991 - block
    b773 - block
    b884 - block
    b798 - block
    b842 - block
    b407 - block
    b89 - block
    b809 - block
    b176 - block
    b92 - block
    b527 - block
    b10 - block
    b341 - block
    b459 - block
    b795 - block
    b244 - block
    b115 - block
    b572 - block
    b126 - block
    b480 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b512 )
    ( on b473 b512 )
    ( on b485 b473 )
    ( on b541 b485 )
    ( on b42 b541 )
    ( on b991 b42 )
    ( on b773 b991 )
    ( on b884 b773 )
    ( on b798 b884 )
    ( on b842 b798 )
    ( on b407 b842 )
    ( on b89 b407 )
    ( on b809 b89 )
    ( on b176 b809 )
    ( on b92 b176 )
    ( on b527 b92 )
    ( on b10 b527 )
    ( on b341 b10 )
    ( on b459 b341 )
    ( on b795 b459 )
    ( on b244 b795 )
    ( on b115 b244 )
    ( on b572 b115 )
    ( on b126 b572 )
    ( on b480 b126 )
    ( clear b480 )
  )
  ( :goal
    ( and
      ( clear b512 )
    )
  )
)
