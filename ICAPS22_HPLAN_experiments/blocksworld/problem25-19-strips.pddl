( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b694 - block
    b613 - block
    b865 - block
    b84 - block
    b731 - block
    b950 - block
    b329 - block
    b687 - block
    b746 - block
    b628 - block
    b654 - block
    b973 - block
    b714 - block
    b529 - block
    b306 - block
    b469 - block
    b593 - block
    b156 - block
    b838 - block
    b373 - block
    b368 - block
    b933 - block
    b600 - block
    b832 - block
    b669 - block
    b457 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b694 )
    ( on b613 b694 )
    ( on b865 b613 )
    ( on b84 b865 )
    ( on b731 b84 )
    ( on b950 b731 )
    ( on b329 b950 )
    ( on b687 b329 )
    ( on b746 b687 )
    ( on b628 b746 )
    ( on b654 b628 )
    ( on b973 b654 )
    ( on b714 b973 )
    ( on b529 b714 )
    ( on b306 b529 )
    ( on b469 b306 )
    ( on b593 b469 )
    ( on b156 b593 )
    ( on b838 b156 )
    ( on b373 b838 )
    ( on b368 b373 )
    ( on b933 b368 )
    ( on b600 b933 )
    ( on b832 b600 )
    ( on b669 b832 )
    ( on b457 b669 )
    ( clear b457 )
  )
  ( :goal
    ( and
      ( clear b694 )
    )
  )
)
