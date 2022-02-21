( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b329 - block
    b850 - block
    b142 - block
    b44 - block
    b325 - block
    b837 - block
    b368 - block
    b166 - block
    b705 - block
    b526 - block
    b193 - block
    b188 - block
    b300 - block
    b647 - block
    b884 - block
    b838 - block
    b788 - block
    b545 - block
    b600 - block
    b453 - block
    b204 - block
    b380 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b329 )
    ( on b850 b329 )
    ( on b142 b850 )
    ( on b44 b142 )
    ( on b325 b44 )
    ( on b837 b325 )
    ( on b368 b837 )
    ( on b166 b368 )
    ( on b705 b166 )
    ( on b526 b705 )
    ( on b193 b526 )
    ( on b188 b193 )
    ( on b300 b188 )
    ( on b647 b300 )
    ( on b884 b647 )
    ( on b838 b884 )
    ( on b788 b838 )
    ( on b545 b788 )
    ( on b600 b545 )
    ( on b453 b600 )
    ( on b204 b453 )
    ( on b380 b204 )
    ( clear b380 )
  )
  ( :goal
    ( and
      ( clear b329 )
    )
  )
)
