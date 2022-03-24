( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b779 - block
    b531 - block
    b510 - block
    b847 - block
    b784 - block
    b823 - block
    b306 - block
    b633 - block
    b649 - block
    b372 - block
    b325 - block
    b241 - block
    b347 - block
    b822 - block
    b604 - block
    b628 - block
    b552 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b779 )
    ( on b531 b779 )
    ( on b510 b531 )
    ( on b847 b510 )
    ( on b784 b847 )
    ( on b823 b784 )
    ( on b306 b823 )
    ( on b633 b306 )
    ( on b649 b633 )
    ( on b372 b649 )
    ( on b325 b372 )
    ( on b241 b325 )
    ( on b347 b241 )
    ( on b822 b347 )
    ( on b604 b822 )
    ( on b628 b604 )
    ( on b552 b628 )
    ( clear b552 )
  )
  ( :goal
    ( and
      ( clear b779 )
    )
  )
)
