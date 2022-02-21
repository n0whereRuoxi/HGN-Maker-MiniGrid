( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b317 - block
    b415 - block
    b217 - block
    b608 - block
    b522 - block
    b872 - block
    b156 - block
    b28 - block
    b990 - block
    b441 - block
    b434 - block
    b962 - block
    b679 - block
    b682 - block
    b710 - block
    b600 - block
    b612 - block
    b518 - block
    b73 - block
    b208 - block
    b639 - block
    b762 - block
    b37 - block
    b545 - block
    b730 - block
    b804 - block
    b542 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b317 )
    ( on b415 b317 )
    ( on b217 b415 )
    ( on b608 b217 )
    ( on b522 b608 )
    ( on b872 b522 )
    ( on b156 b872 )
    ( on b28 b156 )
    ( on b990 b28 )
    ( on b441 b990 )
    ( on b434 b441 )
    ( on b962 b434 )
    ( on b679 b962 )
    ( on b682 b679 )
    ( on b710 b682 )
    ( on b600 b710 )
    ( on b612 b600 )
    ( on b518 b612 )
    ( on b73 b518 )
    ( on b208 b73 )
    ( on b639 b208 )
    ( on b762 b639 )
    ( on b37 b762 )
    ( on b545 b37 )
    ( on b730 b545 )
    ( on b804 b730 )
    ( on b542 b804 )
    ( clear b542 )
  )
  ( :goal
    ( and
      ( clear b317 )
    )
  )
)
